import React from "react"
import ShopReviewTile from "./ShopReviewTile"

const ShopReviewsList = (props) => {
  debugger
  const reviewTiles = props.reviews.map((review) => {
    return (
      <ShopReviewTile key={review.id} review={review} />
    )
  })

  return(
    <div>
      {reviewTiles}
    </div>
  )
}

export default ShopReviewsList