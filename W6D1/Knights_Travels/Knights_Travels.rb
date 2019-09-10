require_relative "Tree_Node"
require 'byebug'
class KnightPathFinder
  attr_reader :considered_positions, :position, :root_node

  def self.valid_moves(pos)
    valid_moves = []
    moves = [
      [2, 1],
      [2, -1],
      [-2, -1],
      [-2, 1],
      [1, 2],
      [1, -2],
      [-1, -2],
      [-1, 2]
    ]
    x, y = pos
    moves.each do |move|
      new_move = [ move[0] + x , move[1] + y]
      unless (new_move[0] >= 8 || new_move[1] >= 8) || (new_move[0] < 0 || new_move[1] < 0)
        valid_moves << new_move
      end 
    end 
    valid_moves
  end

  def initialize(position)
    @position = position
    @considered_positions = [position]
    @root_node = PolyTreeNode.new(position)
    build_move_tree
  end 

  def new_move_positions(position)
    moves = KnightPathFinder.valid_moves(position)
    valid = moves.select do |move| 
      !@considered_positions.include?(move)
    end
    @considered_positions.concat(valid)
    valid
  end

  def build_move_tree
    start_pos = @root_node
    queue = [start_pos]
    until queue.empty?  
      next_node = queue.shift  
      new_move_positions(next_node.value).each do |position|
        child = PolyTreeNode.new(position)
        queue << child
        next_node.children << child
        child.parent = next_node
      end  
    end 
  end 

  def find_path(end_pos)
    end_node = @root_node.dfs(end_pos) 
    path = [end_node] 
    until path.first.value == @root_node.value 
      target = @root_node.dfs(path.first.value) 
      path.unshift(target.parent) 
    end                           
    path
  end

  def trace_path_back(target)
    queue = []
    other_node = target
    until queue.nil?
      queue << other_node
      other_node = other_node.parent
    end 
    queue
  end
end 

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]





