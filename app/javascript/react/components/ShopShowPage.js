import React, { useState, useEffect } from "react"
import NewReviewForm from "./NewReviewForm"
import { Link } from "react-router-dom"
import ShopReviewsList from "./ShopReviewsList"

const ShopShowPage = (props) => {
  const [shop, setShop] = useState({
    current_user: {},
    reviews: [],
  })

  const fetchShop = async () => {
    try {
      const shopId = props.match.params.id
      const response = await fetch(`/api/v1/shops/${shopId}`)
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        throw new Error(errorMessage)
      }
      const responseBody = await response.json()
      const newShop = responseBody.shop
      setShop(newShop)
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`)
    }
  }

  useEffect(() => {
  fetchShop()
  }, [])

  const submit = async (newReview) => {
    try {
      const response = await fetch(`/api/v1/shops/${shop.id}/reviews`, {
        method: "POST",
        credentials: "same-origin",
        headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
        body: JSON.stringify({ review: newReview })
      })
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        throw new Error(errorMessage)
      }
      const newReviewData = await response.json()
      let currentReviews = shop.reviews
      currentReviews = currentReviews.concat(newReviewData.review)
      setShop({
        ...shop,
        ["reviews"]: currentReviews
      })
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`)
    }
  }

  let showReviewForm
  if (shop.current_user) {
    showReviewForm = <div><NewReviewForm submit = {submit} /></div>
  }

  return (
    <div className="grid-container">
      <div className="grid-x grid-margin-x">
        <div className="grid-container cell medium-6">
          <h1 className="header-text">{shop.name}</h1>
          <div className="cell">
            <img src={shop.picture}/>
          </div>
          <p>{shop.address}</p>
          <p>
            {shop.city}, {shop.state} {shop.zip}
          </p>
          <p>Telephone: {shop.telephone}</p>
          <button type="button" className="button">
            <a href={shop.website} target="_blank">Visit Our Website!</a>
          </button>
          {showReviewForm}
        </div>
        <div className="grid-container medium-6">
          <h2>{shop.name}'s Reviews</h2>
          <ShopReviewsList 
            key={shop.id} 
            shop={shop}
          />
        </div>
      </div>
    </div>
  )
}

export default ShopShowPage