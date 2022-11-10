import React, { useState } from "react"
import _ from "lodash"
import ErrorList from "./ErrorList"

const NewReviewForm = (props) => {
  const [reviewRecord, setReviewRecord] = useState({
    rating: "0",
    body: "",
    user: {},
    shop: {}
  })

  const [errors, setErrors] = useState({})

  const validForSubmission = () => {
    let submitErrors = {}
    const requiredFields = ["rating", "body"]
    requiredFields.forEach(field => {
      if (reviewRecord[field] === "0" || reviewRecord[field].trim() === "") {
        submitErrors = {
          ...submitErrors,
          [field]: "is blank"
        }
      }
    })
    setErrors(submitErrors)
    return _.isEmpty(submitErrors)
  }

  const changeHandler = (event) => {
    setReviewRecord({
      ...reviewRecord,
      [event.currentTarget.name]: event.currentTarget.value,
    })
  }

  const handleSubmit = (event) => {
    event.preventDefault()
    if (validForSubmission()) {
      props.submit(reviewRecord)
    }
    setReviewRecord({
      rating: "0",
      body: "",
      user: {},
      shop: {}
    })
  }

  return (
    <form className="form-container" onSubmit={handleSubmit}>
      <ErrorList errors={errors} />
      <div className="new-review">
        <h2>New Review Form:</h2>
        <label className="form-text">Rating:
          <select name="rating" id="rating" value={reviewRecord.rating || "0"} onChange={changeHandler}>
            <option value="0">Select rating</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
        </label>
        <label className="form-text">Review:
          <input
            name="body"
            id="body"
            type="text"
            value={reviewRecord.body}
            onChange={changeHandler}
          />
        </label>
        <div>
          <input className="button" type="submit" value="Add Review" />
        </div>
      </div>
    </form>
  )
}

export default NewReviewForm