import React from "react"

const ShopTile = (props) => {
  return (
    <div>
      <h1>{props.shop.name}</h1>
      <img src={props.shop.picture}/>
      <p>{props.shop.address}</p>
      <p>
        {props.shop.city}
      </p>
    </div>
  )
}

export default ShopTile