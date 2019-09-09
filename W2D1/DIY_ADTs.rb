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

class Queue
  attr_reader :line

  def initialize
    @line = Array.new
  end

  def enqueue(ele)
    @line << ele
  end

  def dequeue
    @line.shift
  end

  def peek
    @line[-1]
  end
end

#queue = Queue.new
#p queue.line
#queue.enqueue("ele1")
#p queue.line
#queue.enqueue("ele2")
#p queue.line
#queue.enqueue("ele3")
#p queue.line
#queue.dequeue
#p queue.line
#queue.enqueue("ele4")
#p queue.line
#p queue.peek

