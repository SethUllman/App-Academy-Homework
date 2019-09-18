require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    list_idx = key.hash % num_buckets
    list = @store[list_idx]
    list.include?(key)
  end

  def set(key, val)
    list_idx = key.hash % num_buckets
    list = @store[list_idx]
    if list.include?(key)
      list.update(key, val)
    else
      if @count == num_buckets
        resize!
      end
      list.append(key, val)
      @count += 1
    end
  end

  def get(key)
    list_idx = key.hash % num_buckets
    list = @store[list_idx]
    list.get(key)
  end

  def delete(key)
    list_idx = key.hash % num_buckets
    list = @store[list_idx]
    list.remove(key)
    @count -= 1
  end
  
  def each(&prc)
    @store.each do |list|
      list.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_hash_map = HashMap.new(num_buckets*2)
    self.each{|k, v| new_hash_map.set(k, v) }
    @store = new_hash_map.store
    @count = new_hash_map.count
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
