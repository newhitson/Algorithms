class BSTNode
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @parent_node = nil
  end
  attr_accessor :value, :right, :left, :parent_node

  def left=(value)
    @left = value
  end

  def right=(value)
    @right = value
  end

  def parent_node=(value)
    @parent_node = value
  end

  def one_child
    return nil if @left == nil && @right == nil
    return @left if @right == nil
    return @right if @left == nil
    nil
  end

  def no_children?
    return false if @left || @right
    true
  end


end
