require_relative "Tree_Node"

class KnightPathFinder
  attr_reader :board
    def initialize(position)
      @position = position
      @board = Array.new(8) {Array.new(8, "X")}
    end 
end 

kpf = KnightPathFinder.new([0, 0])
p kpf.board
tree = PolyTreeNode.new(10)