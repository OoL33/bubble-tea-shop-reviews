import React from "react"
import ShopShowPage from "./ShopShowPage"
import {BrowserRouter, Route} from "react-router-dom"

export const App = (props) => {
	return (
		<div>
			<BrowserRouter>
				<Route exact path="/shops/:id" component={ShopShowPage} />
			</BrowserRouter>
		</div>
	)
}

export default App
