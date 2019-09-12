require_relative 'Slideable'

class Rook < Piece
  include Slideable
  
  def symbol
    
  end

  protected

  def move_dirs
    HORIZONTAL_DIRS
  end

end


class Bishop < Piece
  include Slideable
  def symbol

  end

  protected

  def move_dirs
    DIAGONAL_DIRS
  end
end


class Queen < Piece
  include Slideable

  def symbol

  end

  protected

  def move_dirs
    DIAGONAL_DIRS + HORIZONTAL_DIRS
  end
  

end