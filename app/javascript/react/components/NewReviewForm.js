import React, { useState } from "react"
import _ from "lodash"
import ErrorList from "./ErrorList"

const NewReviewForm = (props) => {
  const [reviewRecord, setReviewRecord] = useState({
    rating: null,
    body: "",
    user: {},
    shop: {}
  })

  const [errors, setErrors] = useState({})

  const validForSubmission = () => {
    let submitErrors = {}
    const requiredFields = ["rating", "body"]
    requiredFields.forEach(field => {
      if (reviewRecord[field] === null || reviewRecord[field].trim() === "") {
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
      rating: null,
      body: "",
      user: {},
      shop: {}
    })
  }

  return (
    <form onSubmit={handleSubmit}>
      <ErrorList errors={errors} />
      <div className="new-review form-container">
        <h2>New Review Form:</h2>
        <label className="form-text">Rating:
          <input
            name="rating"
            id="rating"
            type="number"
            value={reviewRecord.rating || ""}
            onChange={changeHandler}
          />
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