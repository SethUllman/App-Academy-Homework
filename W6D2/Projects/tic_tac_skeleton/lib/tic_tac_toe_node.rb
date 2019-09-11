require_relative 'tic_tac_toe'
require 'byebug'
class TicTacToeNode
  attr_reader :board ,:next_mover_mark ,:prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark #childrens marker
    @prev_move_pos = prev_move_pos if !prev_move_pos.nil? #parent
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    root = TicTacToeNode.new(board, next_mover_mark)
    next_moves = [root] 
    until next_moves.empty?
      debugger
      next_node = next_moves.shift
      next_node.next_mover_mark == :x ? (:o) : (:x)

      next_node.board.rows.flatten.each_with_index do |position, index|
        if position.nil? 
          dupped_board = next_node.board.dup
          dupped_board[index] = next_mover_mark
          next_moves << TicTacToeNode.new(dupped_board, next_mover_mark, position) 
        end
      end  

    end
    next_moves
  end
end
