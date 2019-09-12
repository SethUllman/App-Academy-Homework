class Piece
  attr_reader :color, :pos, :board
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    board.add_piece(self, pos)    
  end

  def to_s
    "#{color}"
    #symbol to string
  end

  def empty?
    false
  end

  def valid_moves
    #calls move into check, calls moves and filters out any move that put us into check
  end

  def pos=(val)
    #changes the position if val.empty?
  end

  def symbol
    #checks the symbol of moving piece?
  end

  private

  def move_into_check?(end_pos)
    #dups board and checks to see if king is in check
  end

end