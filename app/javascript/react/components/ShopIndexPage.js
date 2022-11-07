import React, { useState, useEffect } from "react"
import { Link } from "react-router-dom"
import ShopTile from "./ShopTile"

const ShopIndexPage = () => {
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

  // if (!currentUser) {
  //   window.location.pathname = "users/sign_in"
  // }

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
    <div>
      <h1>All Bubble Tea Shops</h1>
      {shopTiles}
    </div>
  )
}

export default ShopIndexPage