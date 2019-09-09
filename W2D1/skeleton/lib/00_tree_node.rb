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

  def inspect
    @value.inspect
  end

end



 