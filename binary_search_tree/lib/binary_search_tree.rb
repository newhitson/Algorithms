# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require 'bst_node.rb'
class BinarySearchTree
  def initialize(root = nil)
    @root = root
  end
  
  attr_accessor :root

  def insert(value)
    return @root = BSTNode.new(value) if @root == nil

    if value < @root.value
      if @root.left.nil?
        new_node = BSTNode.new(value)
        @root.left = new_node
        new_node.parent_node = @root
      else
        go_deep(@root.left, value)
      end
    else
      if @root.right.nil?
        new_node = BSTNode.new(value)
        @root.right = new_node
        new_node.parent_node = @root
      else
        go_deep(@root.right, value)
      end
    end

  end

  def find(value, tree_node = @root)
    return tree_node if tree_node.value == value
    if value < tree_node.value
      if tree_node.left.nil?
        return nil
      else
        return find(value, tree_node.left)
      end
    else
      if tree_node.right.nil?
        return nil
      else
        return find(value, tree_node.right)
      end
    end
  end

  def delete(value)
    bye_node = find(value, @root)

    if bye_node == @root
      return @root = nil
    end

    if bye_node.no_children?

      if bye_node.parent_node.left == bye_node
        bye_node.parent_node.left = nil
      else
        bye_node.parent_node.right = nil
      end

    elsif bye_node.one_child

      if bye_node.parent_node.left == bye_node
        bye_node.parent_node.left = bye_node.one_child
      else
        bye_node.parent_node.right = bye_node.one_child
      end

    else
      new_node = maximum(bye_node.left)


      if bye_node.parent_node.left == bye_node
        new_node.parent_node.right = new_node.left

        bye_node.parent_node.left = new_node
        bye_node.left.parent_node = new_node
        bye_node.right.parent_node = new_node

        new_node.right = bye_node.right
        new_node.left = bye_node.left
        new_node.parent_node = bye_node.parent_node

      else

        bye_node.parent_node.left = new_node
        bye_node.left.parent_node = new_node
        bye_node.right.parent_node = new_node

        new_node.right = bye_node.right
        new_node.left = bye_node.left
        new_node.parent_node = bye_node.parent_node
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right == nil
    return maximum(tree_node.right)

  end

  def depth(tree_node = @root)
    return 0 if tree_node == nil

    deepness = 0

    if tree_node.right == nil && tree_node.left == nil
      return deepness
    else
      right = depth(tree_node.right)
      left = depth(tree_node.left)
      right > left ? deepness += right + 1 : deepness += left +1
    end
    return deepness

  end

  def is_balanced?(tree_node = @root)
    return true if depth(tree_node.left) == depth(tree_node.right)
    false
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr << tree_node.value if tree_node.no_children?
    in_order_traversal(tree_node.left, arr) if tree_node.left
    arr << tree_node.value
    in_order_traversal(tree_node.right, arr) if tree_node.right
    arr
  end


  private

  def go_deep(parent_node, value)
    if value < parent_node.value
      if parent_node.left.nil?
        new_node = BSTNode.new(value)
        parent_node.left = new_node
        new_node.parent_node = parent_node
      else
        go_deep(parent_node.left, value)
      end
    else
      if parent_node.right.nil?
        new_node = BSTNode.new(value)
        parent_node.right = new_node
        new_node.parent_node = parent_node
      else
        go_deep(parent_node.right, value)
      end
    end
  end
  # optional helper methods go here:

end
