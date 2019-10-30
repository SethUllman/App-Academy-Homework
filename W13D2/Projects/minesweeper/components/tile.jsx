import React from "react";
import Minesweeper from "./minesweeper.js";

export default class Tile extends React.Component {
  constructor(props) {
    super(props)
    this.handleClick = this.handleClick.bind(this);
    
  }

  render() {
    // return "T"
    let classs;
    let fill;
    const tile = this.props.tile;
    if(tile.explored && tile.bombed) {
      classs = "tile bombed";
      fill = "💣";
      window.alert("💥YOU LOST SON💥")
    } else if(tile.explored && tile.adjacentBombCount() === 0){
      classs = "tile revealed";
      fill = "";
    } else if (tile.explored && tile.adjacentBombCount() > 0) {
      classs = "tile revealed";
      fill = tile.adjacentBombCount();
    } else if(tile.flagged) {
      classs = "tile flagged";
      fill = "🍆"
    } else {
      classs = "tile";
      fill = " "
    }
    return <div className={classs} onClick={this.handleClick}>{fill}</div>
  }

  handleClick(e) {
    const flag = e.altKey ? true : false;
    this.props.updateGame(this.props.tile, flag);
  }
}