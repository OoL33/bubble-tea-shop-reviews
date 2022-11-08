import React, { useState, setState, useEffect } from "react"

const NewReviewForm = (props) => {

	const [reviewRecord, setReviewRecord] = useState({
		rating: null,
		body: "",
		user_id: "",
		shop_id: ""
	})

	const changeHandler = (event) => {
		setReviewRecord({
			...reviewRecord,
			[event.currentTarget.name]: event.currentTarget.value,
		})
	}



	const handleSubmit = async (event) => {
		event.preventDefault()

		try {
			debugger
			const shopId = props.shopRecord.id
			const response = await fetch(`/api/v1/shops/${shopId}/reviews`, {
				method: "POST",
				credentials: "same-origin",
				headers: {
					"Accept": "application/json",
					"Content-Type": "application/json"
				},
				body: JSON.stringify({ review: reviewRecord })
			})
			if (!response.ok) {
				const errorMessage = `${response.status} (${response.statusText})`
				throw new Error(errorMessage)
			}
			const responseBody = await response.json()
			setReviewRecord(responseBody)

			props.setReviews([
				...props.reviews,
				reviewRecord
			])


		} catch (error) {
			console.error(`Error in fetch: ${error.message}`)
		}

	}

	// useEffect(() => {
	// 	handleSubmit()
	// }, [])

	return (
		<form onSubmit={handleSubmit}>
			<h1>New Review Form:</h1>
			<label>Rating:
				<input
					name="rating"
					id="rating"
					type="number"
					value={reviewRecord.rating || ""}
					onChange={changeHandler}
				/>
			</label>
			<label>Review:
				<input
				name="body"
				id="body"
				type="text"
				value={reviewRecord.body}
				onChange={changeHandler}
				/>
			</label>
			<div>
				<input type="submit" value="Add Review" />
			</div>
		</form>
	)
}

export default NewReviewForm