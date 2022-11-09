import React, { useState, useEffect } from "react"
import { Link } from "react-router-dom"
import ShopTile from "./ShopTile"

const ShopsIndexPage = () => {
  const [getShops, setShops] = useState([])

  const showShops = async () => {
    try {
      const response = await fetch("/api/v1/shops")
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        throw new Error(errorMessage)
      }
      const responseBody = await response.json()
      const shopsData = responseBody.shops
      setShops(shopsData)
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`)
    }
  }

  useEffect(() => {
    showShops()
  }, [])



  const shopTiles = getShops.map((shop) => {
    return (
      <Link to={`/shops/${shop.id}`} key={shop.id}>
        <ShopTile
          shop={shop}
        />
      </Link>
    )
  })

  return (
    <div className="webpage">
      <div>
        <h1>All Bubble Tea Shops</h1>
        <div className="grid-container">
          <div className="grid-x grid-margin-x small-up-2 medium-up-3 large-up-4">
            {shopTiles}
          </div>
        </div>
      </div>

      <Link to="/shops/new">
        <button type="button" className="button">
          Add a new Bubble Tea Shop
        </button>
      </Link>
    </div>
  )
}

export default ShopsIndexPage