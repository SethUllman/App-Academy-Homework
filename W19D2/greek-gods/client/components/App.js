import React from "react";
import { Route, Switch } from 'react-router-dom';
import { GodsList } from './gods/GodsList';
import CreateIndex from './create/CreateIndex';
import NavBar from './nav_bar';
import GodDetail from './gods/GodDetail';

export const App = () => {
  return (
    <div>
      <NavBar/>
      <Switch>
        <Route exact path="/gods/:id" component={GodDetail} />
        <Route exact path="/new" component={CreateIndex} />
        <Route exact path="/" component={GodsList} />
      </Switch>
    </div>
  );
};

