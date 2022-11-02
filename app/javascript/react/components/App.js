import React from "react"
import ShopShowPage from "./ShopShowPage"
import ShopIndexPage from "./ShopIndexPage"
import { BrowserRouter, Route } from "react-router-dom"

export const App = (props) => {
	return (
		<div>
			<BrowserRouter>
				<Route exact path="/" component={ShopIndexPage} />
				<Route exact path="/shops" component={ShopIndexPage} />
				<Route exact path="/shops/:id" component={ShopShowPage} />
			</BrowserRouter>
		</div>
	)
}

export default App
