module Stepable

  def moves
    row, col = pos
    moves = []

    move_diffs.each do |dx, dy|
      new_x, new_y = row + dx, col + dy
      new_pos = [new_x, new_y]
      unless !board.valid_pos?(new_pos)
        piece = board[new_pos]
        if piece.empty? || piece.color != self.color
         moves << new_pos
        end
      end  
    end
    moves     
  end  
end