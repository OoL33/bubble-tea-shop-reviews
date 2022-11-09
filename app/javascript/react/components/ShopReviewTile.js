import React from "react"

const ShopReviewTile = (props) => {
  return (
    <div className="callout secondary review-box">
      <ul>
        <li>User: {props.review.user.email}</li>
        <li>Rating: {props.review.rating}/5</li>
        <li>Review: {props.review.body}</li>
      </ul>
    </div>
  )
}

export default ShopReviewTile