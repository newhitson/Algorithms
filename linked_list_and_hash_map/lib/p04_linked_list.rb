class Node
  attr_accessor :key, :val, :next, :prev


  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @next.prev = @prev
    @prev.next = @next
    # optional but useful, connects previous node to next node
    # and removes self from list.
  end
end

class LinkedList

  include Enumerable

  def initialize
    @head = Node.new(:first)
    @tail = Node.new(:last)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    first == @tail
  end

  def get(key)
    each {|node| return node.val if node.key == key}
    nil
  end

  def include?(key)
    each {|node| return true if node.key == key}
    false
  end

  def append(key, val)
    old_last = last

    new_node = Node.new(key , val)

    new_node.next = @tail
    @tail.prev = new_node

    new_node.prev = old_last
    old_last.next = new_node


  end

  def update(key, val)
    each {|node| node.val = val if node.key = key}

  end

  def remove(key)
    each {|node| node.remove if node.key == key}
  end

  def each

    current_node = first

    until current_node == @tail
      yield(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
