import React from "react"
import ShopShowPage from "./ShopShowPage"
import ShopsIndexPage from "./ShopsIndexPage"
import NewShopForm from "./NewShopForm"
import { BrowserRouter, Route, Switch } from "react-router-dom"

export const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={ShopsIndexPage} />
        <Route exact path="/shops" component={ShopsIndexPage} />
        <Route exact path="/shops/new" component={NewShopForm} />
        <Route exact path="/shops/:id" component={ShopShowPage} />
      </Switch>
    </BrowserRouter>
  )
}

export default App