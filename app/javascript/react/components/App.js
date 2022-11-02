import React from "react"
import ShopShowPage from "./ShopShowPage"
import ShopIndexPage from "./ShopIndexPage"
import { BrowserRouter, Route, Switch } from "react-router-dom"

export const App = (props) => {
  return (
    <div>
      <BrowserRouter>
        <Switch>
          <Route exact path="/" component={ShopIndexPage} />
          <Route exact path="/shops" component={ShopIndexPage} />
          <Route exact path="/shops/:id" component={ShopShowPage} />
        </Switch>
      </BrowserRouter>
    </div>
  )
}

export default App