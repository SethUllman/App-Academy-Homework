class Stack
  attr_reader :stack
  def initialize
    @stack = Array.new
  end

  def push(ele)
    @stack.push(ele)
  end

  def pop
    @stack.pop
  end

  def peek
    stack[-1]
  end
end

stack = Stack.new
stack.push("string")
p stack.stack
stack.push(52)
p stack.stack
p stack.peek
stack.pop
p stack.stack