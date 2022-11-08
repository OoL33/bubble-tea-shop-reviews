import React, { useState, setState } from "react"

const NewReviewForm = (props) => {

	const [reviewRecord, setReviewRecord] = useState({
		rating: "",
		body: ""
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
			const shopId = props.show.match.params.id
			const response = await fetch(`/api/v1/shops/${shopId}/reviews`, {
				method: "POST",
				headers: {
					"Content-Type": "application/json"
				},
				body: JSON.stringify({ review: reviewRecord })
			})
			if (!response.ok) {
				const errorMessage = `${response.status} (${response.statusText})`
				throw new Error(errorMessage)
			}
			const responseBody = await response.json()


		} catch (error) {
			console.error(`Error in fetch: ${error.message}`)
		}

	}


	return (
		<form onSubmit={handleSubmit}>
			<h1>New Review Form:</h1>
			{/* <input type="hidden" id="shop" name="shop" value={props.shop.id} /> */}
			<label>Rating:
				<input
					name="rating"
					id="rating"
					type="text"
					value={reviewRecord.rating}
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