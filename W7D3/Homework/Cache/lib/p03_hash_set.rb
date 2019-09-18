class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    value = key.hash 
    bucket = value%num_buckets
    unless include?(key)
      resize! if @count == num_buckets
      @store[bucket] << key
      @count += 1
    end
  end

  def include?(key)
    value = key.hash
    bucket = value%num_buckets
    @store[bucket].include?(key)
  end

  def remove(key)
    value = key.hash
    bucket = value%num_buckets
    if include?(key)
      @store[bucket].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.dup
    new_buckets = num_buckets*2
    @store = Array.new(new_buckets) {Array.new}
    @count = 0
    old_store.each do |bucket|
      bucket.each do |ele|
        insert(ele)
      end
    end
  end
end
