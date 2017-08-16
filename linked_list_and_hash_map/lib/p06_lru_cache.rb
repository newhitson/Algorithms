require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)

    if @map[key]
      old_node = @map.get(key)
      update_node!(old_node)
      old_node.val
    else
      calc!(key)
    end

  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key

    value = @prc.call(key)

    new_node = @store.append(key, value)

    @map.set(key, new_node)

    eject!

    new_node.val

  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    @store.remove(node.key)
    @store.append(node.key, node.val)
  end

  def eject!

    if count > @max
      old_node = @store.first
      @map.delete(old_node.key)
      @store.remove(old_node.key)

    end
  end
end
