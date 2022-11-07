import React from "react"

const ShopTile = (props) => {
  return (
    <div className="cell">
      <div className="card">
        <div className="card-section">
          <img className="contain-image" src={props.shop.picture}/>
        </div>
        <div className="card-section">
          <h3 className="card-title">{props.shop.name}</h3>
          <p>{props.shop.address}</p>
          <p>{props.shop.city}</p>
        </div>
      </div>
    </div>
  )
}

export default ShopTile