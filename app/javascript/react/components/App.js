import React from "react"
import ShopShowPage from "./ShopShowPage"
import ShopIndexPage from "./ShopIndexPage"
import ShopTile from "./ShopTile"
import NewShopForm from "./NewShopForm"
import { BrowserRouter, Route, Switch } from "react-router-dom"

export const App = (props) => {
  return (
      <BrowserRouter>
        <Switch>
          <Route exact path="/" component={ShopIndexPage} />
          <Route exact path="/shops" component={ShopIndexPage} />
          <Route exact path="/shops/new" component={NewShopForm} />
          <Route exact path="/shops/:id" component={ShopShowPage} />
        </Switch>
      </BrowserRouter>
  )
}

export default App