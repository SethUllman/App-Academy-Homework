import React from "react";
import * as Minesweeper from "./minesweeper.js";
import Board from "./board";

export default class Game extends React.Component {
  constructor(props) {
    super(props)
    const board = new Minesweeper.Board(20, 20);
    this.state = { board: board };
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tile, bool) {
    if(bool) {
      tile.toggleFlag();
    } else {
      tile.explore();
      console.log("click")
    }
    this.setState({ board: this.state.board });
  }

  render() {
    return (<Board 
    board={this.state.board}
    updateGame={this.updateGame}/>
    );
  }
}
