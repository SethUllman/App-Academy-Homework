import React from 'react';
import { Link } from 'react-router-dom';

class NavBar extends React.Component{
  render(){
    return(
      <nav>
        <Link to="/">Home</Link>
        <br/>
        <Link to="/new">New</Link>
      </nav>
    )
  }
}

export default NavBar;