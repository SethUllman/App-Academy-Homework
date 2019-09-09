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

class Map
  attr_reader :map

  def initialize
    @map = Array.new
  end

  def set(key, value)
    if !map.flatten.include?(key)
      map << [key, value]
    end
  end

  def get(key)
    return nil if !map.flatten.include?(key)
    map.select {|sub| sub if sub.include?(key)}
  end

  def delete(key)
    i = 0
    while i < map.length
      if map[i].include?(key)
        map.delete_at(i)
        break
      end
      i += 1
    end
  end

  def show
    p map
  end
end



