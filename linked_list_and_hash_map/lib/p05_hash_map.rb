require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap

    include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def set(key, val)
    resize! if num_buckets == count
    if @store[key.hash % num_buckets].include?(key)
      @store[key.hash % num_buckets].update(key, val)
    else
      @store[key.hash % num_buckets].append(key, val)
      @count += 1
    end
  end

  def get(key)
    @store[key.hash % num_buckets].get(key)
  end

  def delete(key)
    @store[key.hash % num_buckets].remove(key)
    @count -= 1
  end

  def each
    @store.each do |link_list|
      link_list.each do |node|
        yield([node.key, node.val])
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
    old_store = @store.dup
    @store = Array.new(num_buckets * 2){LinkedList.new}
    old_store.each { |linklist| linklist.each { |node| set(node.key, node.val)}}


  end

  def bucket(key)
     @store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `key`
  end
end
