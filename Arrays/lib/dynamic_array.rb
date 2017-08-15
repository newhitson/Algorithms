require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@length)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    if @length - 1 < 0
      raise "index out of bounds"
    else
      @length -= 1
      @store[@length + 1]
    end
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @length += 1
    resize! if @length > @capacity
    @store[@length] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    if @length - 1 < 0
      raise "index out of bounds"
    else
    self.check_index(@length - 1)
    @length -= 1
    num = @store[0]
    @store = @store[1..@length]
    num
  end
end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @length += 1
    resize! if @length > @capacity
    i = @length - 1
    while i > 0
      @store[i] = @store[i - 1]
      i -= 1
    end
    @store[0] = val

  end



  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if (index >= @length)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
    old_store = @store
    @store = StaticArray.new(@length)
    @length.times do |i|
      @store[i] = old_store[i]
    end
  end
end
