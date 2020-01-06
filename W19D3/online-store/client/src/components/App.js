import React from 'react';
import { Switch, Route } from 'react-router-dom';
import ProductIndex from './products/ProductIndex';
import Login from './Login';
import '../App.css';
import AuthRoute from '../util/route_util';

const App = () => {
  return (
    <div>
      <h1>Online Store</h1>
      <Switch>
        <AuthRoute exact path="/login" component={Login} routeType='auth' />
        <Route path="/" component={ProductIndex} />
      </Switch>
    </div>
  );
};

export default App;
