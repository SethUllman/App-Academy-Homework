require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'
class LRUCache
  def initialize(max, prc)
    @map = HashMap.new      #map
    @store = LinkedList.new #cache
    @max = max
    @prc = prc
    @store_count = 0
  end

  def count
    @map.count
  end

  def get(key)
    if @store.include?(key)
      value = @store.get(key)
      @store.remove(key)
      new_node = @store.append(key, value)
      @map.set(key, new_node)
    else
      new_node = @store.append(key, @prc.call(key))
      @store_count += 1
      @map.set(key, new_node)
      if @store_count > @max
        eject!
      end
      @store.get(key)
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list

  end

  def eject!
    # @store.remove(@store.last.key)
    least_used = @store.first
    least_key = least_used.key
    @map.delete(least_key)
    @store.remove(least_key)
    @store_count -= 1
  end
end
