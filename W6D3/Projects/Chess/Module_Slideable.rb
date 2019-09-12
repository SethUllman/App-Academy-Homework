module Slideable

DIAGONAL_DIRS = [
  [-1,  1],
  [-1, -1],
  [1,  1],
  [1, -1]
]

HORIZONTAL_DIRS = [
  [1,0],
  [0,1],
  [-1,0],
  [0,-1]
]

def horizontal_dirs
  HORIZONTAL_DIRS
end

def diagonal_dirs
  DIAGONAL_DIRS
end

def moves
  moves = []

  move_dirs.each do |dx, dy|
    moves.concat(grow_unblocked_moves_in_dir(dx, dy))
  end
  moves
end


private

def grow_unblocked_moves_in_dir(dx, dy)
  row, col = pos
  moves = []

  loop do  
    pos_x, pos_y = row + dx, col + dy
    new_pos = [pos_x, pos_y]

    break unless board.valid_pos?(new_pos)
    piece = board[new_pos]
      if piece.empty?
        moves << new_pos
      else  
        moves << new_pos if piece.color != self.color
        break
      end     
  end
  moves
end