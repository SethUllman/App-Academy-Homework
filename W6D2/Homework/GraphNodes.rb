class GraphNode
  attr_reader :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def neighbors=(neighbor)
    self.neighbors.concat(neighbor)
  end

  def inspect
    @value.inspect
  end

end

def bfs(starting_node, target_value)
  queue = []
  visited = []
  queue << starting_node
  until queue.empty?
    first = queue.shift
    if first.value != target_value
      visited << first
      first.neighbors.each do |neighbor| 
        queue << neighbor if !visited.include?(neighbor)
      end
    else
      return first
    end
  end
  nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]



p bfs(a, "b")
p bfs(a, "f")