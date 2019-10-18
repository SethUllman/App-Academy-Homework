class Board {
  constructor() {
    this.grid = makeGrid();
  }
}

Board.prototype.makeGrid = () => {
  const grid = new Array(3);
  for (i = 0; i < grid.length; i++) {
    grid[i] = new Array(3);
  }
  return grid;
}

Board.prototype.placeMark = (pos, mark) => {
  if (validMove) {
    this.grid[pos[0]][pos[1]] = mark;
  };
}; 

Board.prototype.validMove = (pos) => { 
  if (pos[0] < 0 || pos[1] < 0 || pos[0] > 2 || pos[1] > 2) { 
    return false;
  } else if (grid[pos[0]][pos[1]] !== undefined) {
    return false; 
  } else { 
    return true; 
  }
}

Board.prototype.won = () => {
  for (i = 0; i < WINS.length; i++) {
    
    if (this.grid[WINS[i]][0] === this.grid[WINS[i]][1] && this.grid[WINS[i]][1] === this.grid[WINS[i]][2]) {
      return true;
    }
    
  }
  return false;
}

const WINS = [
  [[0,0], [0,1], [0,2]], 
  [[1, 0], [1, 1], [1, 2]],
  [[2, 0], [2, 1], [2, 2]],

  [[0, 0], [1, 0], [2, 0]], 
  [[0, 1], [1, 1], [2, 1]],
  [[0, 2], [1, 2], [2, 2]],

  [[0, 0], [1, 1], [2, 2]],
  [[2, 0], [1, 1], [0, 2]]
]; 