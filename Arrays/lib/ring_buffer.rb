require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @count = 0
    @start_idx = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)

  end

  def length
    @count
  end
  # O(1)
  def [](index)
    check_index(index)
    ring_index = (index + start_idx) % capacity
    @store[ring_index]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    ring_index = (index + start_idx) % capacity
    @store[ring_index] = val
  end

  # O(1)
  def pop
    if @count - 1 < 0
      raise "index out of bounds"
    else
      @count -= 1
      ring_index = (@count + start_idx) % capacity
      @store[ring_index]
    end

  end

  # O(1) ammortized
  def push(val)
    resize! if (length == capacity)
    push_ring_index = (@count + start_idx) % capacity
    @store[push_ring_index] = val
    @count += 1
  end


  # O(1)
  def shift
    if @count - 1 < 0
      raise "index out of bounds"
    else
      @count -= 1
      first_el = @store[@start_idx]
      @start_idx = (@start_idx + 1) % capacity
      first_el
    end



  end

  # O(1) ammortized
  def unshift(val)
    resize! if (length == capacity)
    @start_idx = (@start_idx - 1) % capacity
    @store[@start_idx] = val
    @count += 1
    self
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if (index >= @count)
  end

  def resize!

    new_store = StaticArray.new(@capacity * 2)
    @count.times do |i|
      new_store[i] = self[i]
    end
    @store = new_store
    @start_idx = 0
    @capacity *= 2
  end



end
