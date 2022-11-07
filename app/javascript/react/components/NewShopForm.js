import React, { useState, useEffect } from "react"
import { Redirect } from "react-router-dom"
import _ from "lodash"
import ErrorList from "./ErrorList"

const NewShopForm = (props) => {
  const [shouldRedirect, setShouldRedirect] = useState(false)
  const [shopRecord, setShopRecord] = useState({
    name: "",
    address: "",
    city: "",
    state: "",
    zip: "",
    telephone: "",
    website: "",
    picture: ""
  })

  const [errors, setErrors] = useState({})

  const validForSubmission = () => {
    let submitErrors = {}
    const requiredFields = ["name", "address", "city", "state", "zip"]
    requiredFields.forEach(field => {
      if (shopRecord[field].trim() === "") {
        submitErrors = {
          ...submitErrors,
          [field]: "is blank"
        }
      }
    })

    setErrors(submitErrors)
    return _.isEmpty(submitErrors)
  }

  const handleInputChange = (event) => {
    setShopRecord({
      ...shopRecord,
      [event.currentTarget.name]: event.currentTarget.value
    })
  }

  const postNewShop = async (event) => {
    event.preventDefault()

    if (validForSubmission()) {
      try {
        const response = await fetch('/api/v1/shops', {
          method: "POST",
          credentials: "same-origin",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify({ shop: shopRecord })
        })
        if (!response.ok) {
          const errorMessage = `${response.status} (${response.statusText})`
          throw new Error(errorMessage)
        }
        setShouldRedirect(true)
      } catch(err) {
        console.error(`Error in fetch: ${err.message}`)
      }
    }
  }

  if (shouldRedirect) {
    return <Redirect to='/shops' />
  }

  return(
    <form onSubmit={postNewShop}>
      <h2>Submit a new Bubble Tea Shop</h2>
      <ErrorList errors={errors} />

      <div className="grid-container form-container">
        <div className="grid-x grid-padding-x">
          <div className="medium-6 cell">
            <label>
              Shop Name
              <input 
                type="text"
                placeholder="Ex. Gong Cha"
                name="name"
                value={shopRecord.name}
                onChange={handleInputChange}
              />
            </label>
          </div>

          <div className="small-12 cell">
            <label>
              Address
              <input 
                type="text"
                placeholder="123 Main Street Unit 1"
                name="address"
                value={shopRecord.address}
                onChange={handleInputChange}
              />
            </label>
          </div>

          <div className="medium-6 cell">
            <label>
              City
              <input 
                type="text"
                name="city"
                value={shopRecord.city}
                onChange={handleInputChange}
              />
            </label>
          </div>

          <div className="medium-6 cell">
            <label>
              State
              <input 
                type="text"
                name="state"
                value={shopRecord.state}
                onChange={handleInputChange}
              />
            </label>
          </div>

          <div className="small-12 cell">
            <label>
              Zip Code
              <input 
                type="text"
                name="zip"
                value={shopRecord.zip}
                onChange={handleInputChange}
              />
            </label>
          </div>

          <div className="medium-9 cell">
            <label>
              Telephone
              <input 
                type="text"
                placeholder="XXX-XXX-XXXX"
                name="telephone"
                value={shopRecord.telephone}
                onChange={handleInputChange}
              />
            </label>
          </div>

          <div className="medium-9 cell">
            <label>
              Website
              <input 
                type="text"
                name="website"
                value={shopRecord.website}
                onChange={handleInputChange}
              />
            </label>
          </div>

          <div className="button-group cell">
            <input 
              className="button"
              type="submit"
            />
          </div>
        </div>
      </div>
    </form>
  )
}

export default NewShopForm