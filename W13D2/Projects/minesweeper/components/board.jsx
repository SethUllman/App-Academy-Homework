import React from "react";
import * as Minesweeper from "./minesweeper.js"
import Tile from "./tile";

export default class Board extends React.Component {
  constructor(props) {
    super(props)
    this.renderRows = this.renderRows.bind(this);
    this.renderTiles = this.renderTiles.bind(this);
  }

  renderRows() {
    const board = this.props.board;
    return board.grid.map((row, idx) => {
      return (
        <div key={idx}>
          {this.renderTiles(row, idx)}
        </div>
      );
    });
  }

  renderTiles(row, idx) {
    return row.map( (el, i) => {
      return (
        <Tile tile={el} key={i} updateGame={this.props.updateGame}/>
      )
    });
  }

  render() {
      
    return (
      <div>
        {this.renderRows()}
      </div>
    );
  }  
}