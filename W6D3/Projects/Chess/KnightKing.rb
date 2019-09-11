require_relative 'Stepable'

class Knight < Piece
include Stepable

  def symbol

  end

  
  protected 

  def move_diffs
    #return array of differential moves
  end

end

class King < Piece
  include Stepable

  def symbol

  end

  
  protected 

  def move_diffs
    #return array of differential moves
  end

end