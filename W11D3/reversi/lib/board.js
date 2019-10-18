let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8);
  for (let i = 0; i < grid.length; i++) {
    grid[i] = new Array(8);
  }
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");
  grid[3][4] = new Piece("black");  
  grid[4][3] = new Piece("black");      
  return grid; 
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
  // this.print();
  console.log(this.print())
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let [x,y] = pos; 
  let valid = this.isValidPos(pos);
  if (!valid) {
    throw Error('Not valid pos!');
  }
    return this.grid[x][y];
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length === 0 ? false : true;

};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let [x,y] = pos;
  let piece = this.grid[x][y];
  if (this.isOccupied(pos) && piece.color === color) {
    return true;
  }
  return false;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let [x,y] = pos;
  if (this.grid[x][y]) {
    return true;
  }
    return false; 
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !(this.hasMove("black") || this.hasMove("white"));
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let [x,y] = pos;
  if ((x >= 0 && x <= 7) && (y >= 0 && y <= 7)) {
    return true;
  }
    return false;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip = []) {
  if (!board.isValidPos(pos) || board.grid[pos[0]][pos[1]] === undefined) {
    return null;
  } 
  let [x1,y1] = pos;
  let [x2,y2] = dir;
  let newPos = [x1 + x2, y1 + y2];
  let piece = board.grid[x1 + x2][y1 + y2];
  if (board.isOccupied(newPos) && piece.color !== color) {
    piecesToFlip.push(newPos);
    _positionsToFlip(board, newPos, color, dir, piecesToFlip);
  }
  // console.log(piecesToFlip);
  return piecesToFlip;
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (this.validMove(pos, color)) {
    let [x,y] = pos;
    let dirMoves = this.dirMoves(pos, color);
    this.grid[x][y] = new Piece(color);
    let piecesToFlip = [];
    dirMoves.forEach(
      (dir) => {piecesToFlip = piecesToFlip.concat(_positionsToFlip(this, pos, color, dir))}
    );
    // console.log(piecesToFlip);
    // [[[3,3],[2,3]],[[1,1]]]
    for (i = 0; i < piecesToFlip.length; i++) {
      let piece = this.getPiece(piecesToFlip[i]);
      // console.log(color);
      piece.color = color;
      //  console.log(piece);
    }
    
  } else {
    throw Error("Invalid Move");
  }
};

Board.prototype.dirMoves = function (pos, color) {
  let dirMoves = [];
  let [x1, y1] = pos;
  
    Board.DIRS.forEach(([x2, y2]) => {
      if (this.isValidPos([x1 + x2, y1 + y2])) {
        let piece = this.grid[x1 + x2][y1 + y2]; //one position from start
        if (piece && piece.color !== color) { //if new pos is opponent color
          let [nX, nY] = [x1 + x2, y1 + y2];
          while (this.isValidPos([nX, nY])) { //continues in direction until off board or our color
            if (this.isOccupied([nX, nY]) && this.grid[nX][nY].color === color) {
              dirMoves.push([x2,y2]);
              break;
            }
            nX += x2;
            nY += y2;
          }
        }
      }
    });
  return dirMoves;
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  console.log("----------------");
  for ( row = 0; row < 8; row++ ) {
    let i = [];
    for ( col = 0; col < 8; col++ ) {
      let result = this.isOccupied([row, col]) ? this.getPiece([row, col]).toString() : " ";
      i.push(result);
    }
    console.log(i.join("|"));
    console.log("----------------");

  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  let [x1,y1] = pos;
  let valid = false;
  if (!this.isOccupied(pos)) {
    Board.DIRS.forEach(([x2,y2]) => { 
      if (this.isValidPos([x1+x2,y1+y2])) {
        let piece = this.grid[x1+x2][y1+y2]; //one position from start
        if (piece && piece.color !== color) { //if new pos is opponent color
          let [nX, nY] = [x1+x2,y1+y2]; 
          while (this.isValidPos([nX, nY])) { //continues in direction until off board or our color
            if (this.isOccupied([nX,nY]) && this.grid[nX][nY].color === color) {
              valid = true; 
              break;
            }
            nX += x2;
            nY += y2; 
          }
        }
      }
    });
  }
  return valid; 
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let moves = [];
  for (row = 0; row < this.grid.length; row++) {
    for (col = 0; col < this.grid.length; col++) {
      // console.log(this);
      if (this.validMove([row,col], color)) {
        let pos = [row,col]
        // console.log([row,col]);
        moves.push(pos);
      }
    }
  }
  return moves;
};

module.exports = Board;
