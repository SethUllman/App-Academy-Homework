require_relative "pieces"
require 'byebug'


class Board
  attr_reader :board

  def populate
    (0...@board.length).each_with_index do |row, x|
      board[row].map!.with_index { |ele, y|  ele = NullPiece.new('', self, [x,y]) if (row > 1 && row < 6)}
    end

    colors = ['black', 'white']
    colors.each do |color|
      populate_backrow(color)
      populate_pawns(color)
    end 
  end

  def populate_backrow(color)
    i = color == 'black' ? 7 : 0
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    pieces.each_with_index do |piece, j|
      piece.new(color, self, [i, j])
    end
  end

  def populate_pawns(color)
    i = color == 'black' ? 6 : 1
    (0..7).each do |j|
      Pawn.new(color, self, [i, j])
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
    @board[row][col] = NullPiece.new('', self, start_pos)
    @board[row1][col1] = piece_to_move
  end

  def render
    @board.each do |row|
      puts row
    end
    nil 
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end

  def valid_pos?(pos)
    row, col = pos 
    range = (0..7).to_a
    range.include?(row) && range.include?(col)
  end

  def add_piece(piece, pos)
    self[pos] = piece
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