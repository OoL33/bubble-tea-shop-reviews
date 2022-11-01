import React from "react"
import ShopShowPage from "./ShopShowPage"
import { BrowserRouter, Route } from "react-router-dom"

export const App = (props) => {
  return (
    <BrowserRouter>
      <Route exact path="/shops/:id" component={ShopShowPage} />
    </BrowserRouter>
  )
}

export default App
