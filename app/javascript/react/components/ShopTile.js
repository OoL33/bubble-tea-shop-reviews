import React from "react"

const ShopTile = (props) => {
  return (
    <div>
      <h1>{props.shop.name}</h1>
      <p>{props.shop.address}</p>
      <p>
        {props.shop.city}, {props.shop.state} {props.shop.zip}
      </p>
    </div>
  )
}

export default ShopTile