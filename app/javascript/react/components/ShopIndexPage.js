import React, { useState, useEffect } from "react"
import { Link } from "react-router-dom"

const ShopIndexPage = () => {
	const [getShops, setShops] = useState([])

	const showShops = async () => {
		try {
			const response = await fetch("/api/v1/shops")
			if (!response.ok) {
				const errorMessage = `${response.status} (${response.statusText})`
				throw new Error(errorMessage)
			}
			const responseBody = await response.json()
			const shopsData = responseBody.shops
			setShops(shopsData)
		} catch (error) {
			console.error(`Error in fetch: ${error.message}`)
		}
	}

	useEffect(() => {
		showShops()
	}, [])

	const shopsList = getShops.map((shop) => {
		return (
			<li key={shop.id}>
				<Link to={`/shops/${shop.id}`}>{shop.name}</Link>
			</li>
		)
	})

	return (
		<div>
			<h1>All Bubble Tea Shops</h1>
			<ul>
				{shopsList}
			</ul>
		</div>
	)
}

export default ShopIndexPage