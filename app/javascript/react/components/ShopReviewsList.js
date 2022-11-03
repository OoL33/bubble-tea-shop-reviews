import React from "react"
import ShopReviewTile from "./ShopReviewTile"

const ShopReviewsList = (props) => {
  const reviewTiles = props.reviews.map((review) => {
    return (
      <ShopReviewTile review={review} />
    )
  })

  return(
    <div>
      {reviewTiles}
    </div>
  )
}

export default ShopReviewsList