class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new { |a , b| a <=> b}
    @store = []
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[@store.length - 1] = @store[@store.length - 1], store[0]
    lost = @store.pop
    @store = BinaryMinHeap.heapify_down(@store, 0)
    lost
  end

  def peek
    @store[0]
  end

  def push(val)

    @store = BinaryMinHeap.heapify_up(@store.push(val), @store.length - 1)

  end

  public
  def self.child_indices(len, parent_index)
      first =  (2 * parent_index) + 1
      secound = (2 * parent_index) + 2
      return [] if first >= len
      return [first] if secound >= len

      [first, secound]

  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) /2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc = prc || Proc.new {|a, b| a <=> b}
    child_index = BinaryMinHeap.child_indices(len, parent_idx)

    return array if child_index.empty?

    first_child = child_index[0]
    if child_index[1] && prc.call(array[first_child], array[child_index[1]]) == 1
      first_child = child_index[1]
    end

    if prc.call(array[first_child], array[parent_idx]) == -1
      array[first_child], array[parent_idx] = array[parent_idx], array[first_child]
      return BinaryMinHeap.heapify_down(array, first_child, len, &prc)
    end
    array

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc = prc || Proc.new {|a, b| a <=> b }

    return array if child_idx == 0
    parent_idx = BinaryMinHeap.parent_index(child_idx)

    if prc.call(array[parent_idx], array[child_idx]) == 1
      array[parent_idx] , array[child_idx] = array[child_idx], array[parent_idx]
      return BinaryMinHeap.heapify_up(array, parent_idx, len, &prc)
    end

    array

  end






end
