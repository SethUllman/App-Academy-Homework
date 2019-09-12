require_relative "Piece"
require_relative "NullPiece"

class Board
  attr_reader :board

  def populate
    (0...@board.length).each do |row|
      board[row].map! {|ele| (row > 1 && row < 6) ? ele = NullPiece.new : ele = Piece.new}
    end
  end

  def initialize
    @board = Array.new(8) { Array.new(8)}
    self.populate
  end

  def move_piece(start_pos, end_pos)
    row, col = start_pos
    row1, col1 = end_pos

    if @board[row][col].class == NullPiece
      raise "There is no piece in that position"
    elsif @board[row1][col1].class == Piece
      raise "Cannot move to position, its occupied"
    end
    piece_to_move = @board[row][col]
    @board[row][col] = NullPiece.new
    @board[row1][col1] = piece_to_move
  end

  def [](pos)

  end

  def []=(pos, val)

  end

  def valid_pos?(pos)
    #checks if pos is on the board
  end

  def add_piece(piece, pos)

  end

  def checkmate?(color)

  end

  def in_check?(color)

  end

  def find_king(color)

  end

  def pieces

  end

  def dup

  end

  def move_piece!(color, start_pos, end_pos)

  end

end