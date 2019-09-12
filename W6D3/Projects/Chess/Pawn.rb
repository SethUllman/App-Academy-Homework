require_relative 'Piece'
class Pawn < Piece

  def symbol

  end

  def move_dirs
    if forward_dir == 1
      [[1, 0], [2, 0]] 
    else
      [[-1, 0], [-2, 0]]
    end
  end

  def moves
    p forward_steps + side_attacks
  end

  private
  
  def at_start_row?
    if (forward_dir == 1) && (pos[0] == 1)
      return true
    elsif forward_dir == -1 && pos[0] == 6
      return true
    end
    false
  end

  def forward_dir
    if self.color == "white"
      return 1
    else
      return -1
    end
  end

  def forward_steps
    moves = []
    row, col = pos
    if at_start_row?
      move_dirs.each do |dx, dy|
        new_pos = [row + dx, col + dy]
        moves << new_pos
      end
    else 
      dx, dy = move_dirs[0]
      new_pos = [row + dx, col + dy]
      moves << new_pos if board.valid_pos?(new_pos)
    end
    moves
  end

  def side_attacks
    moves = []
    row, col = pos

    if forward_dir == 1  
      attacks = [[1, 1],[1,-1]]
      attacks.each do |dx, dy|
        new_pos = [row + dx, col + dy]
        if board[new_pos].color != self.color && board[new_pos].class != NullPiece
          moves << new_pos if board.valid_pos?(new_pos)
        end
      end
    else
      attacks = [[-1,-1],[-1, 1]]
      attacks.each do |dx, dy|
        new_pos = [row + dx, col + dy]
        if board[new_pos].color != self.color && board[new_pos].class != NullPiece
          moves << new_pos if board.valid_pos?(new_pos)
        end
      end
    end
    moves
  end
end