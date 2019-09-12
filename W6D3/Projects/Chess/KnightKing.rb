require_relative 'Module_Stepable'
require_relative 'Piece'

class Knight < Piece
include Stepable

  KNIGHT_MOVES = [
    [2, 1],
    [2, -1],
    [-2, 1],
    [-2, -1],
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2]
  ]

  def symbol

  end

  
  protected 

  def move_diffs
    KNIGHT_MOVES
  end

end

class King < Piece
  include Stepable

  KING_MOVES = [
    [1,0],
    [1,1],
    [0,1],
    [-1,1],
    [-1,0],
    [-1,-1],
    [0, -1],
    [1, -1]
  ]

  def symbol

  end

  
  protected 

  def move_diffs
    KING_MOVES
  end

end