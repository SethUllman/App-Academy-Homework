class PolyTreeNode

  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if node.nil?
      @parent = nil
    else
      @parent.children.delete(self) if !@parent.nil?
      @parent = node
      @parent.children << self if !@parent.children.include?(self) && !@parent.children.nil?
    end 
  end

  def add_child(child_node)
      child_node.parent = self
  end

  def remove_child(child_node)
    raise "Not child" if child_node.parent.nil? 
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      found = child.dfs(target_value)
      return found if !found.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = []
    queue << self 
    until queue.empty?
        first = queue.shift
        if first.value == target_value
            return first
        else 
            first.children.each{|child| queue.push(child)}
        end 
    end
    nil 
  end

  def inspect
    @value.inspect
  end

end



 