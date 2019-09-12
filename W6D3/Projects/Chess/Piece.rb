class Piece

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos    
  end

  def to_s
    #overwrite the to_s method
  end

  def empty?
    false
  end

  def valid_moves
    #checks the current valid moves, returns array of possible moves
  end

  def pos=(val)
    #changes the position if val.empty?
  end

  def symbol
    #checks the symbol of moving piece?
  end

  private

  def move_into_check?(end_pos)
    #checks if our king in moving into check, returns true or false
  end

end