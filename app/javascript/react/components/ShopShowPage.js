import React, {useState, useEffect} from "react"

const ShopShowPage = (props) => {
  const [shop, setShop] = useState({})

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

  return (
    <div>
      <h1>{shop.name}</h1>
      <img src={shop.picture}/>
      <p>{shop.address}</p>
      <p>
        {shop.city}, {shop.state} {shop.zip}
      </p>
      <a href={shop.website} target="_blank">{shop.website}</a>
      <p>Telephone: {shop.telephone}</p>
    </div>
  )
}

export default ShopShowPage