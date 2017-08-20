require 'binary_search_tree'
def kth_largest(tree_node, k)
  arr = []
  tree = BinarySearchTree.new(tree_node)
  result = tree.in_order_traversal(tree_node , arr)
  tree.find(result[result.length - k])

end
