require_relative './node.rb'

class BinarySearchTree
  def initialize(root_value = nil)
    @root = Node.new(root_value) unless root_value.nil?
  end

  def self.build_tree(input_array)
    tree = BinarySearchTree.new
    input_array.each do |data|
      tree.add(data)
    end
    tree
  end

  def add(node_value)
    if @root.nil?
      @root = Node.new(node_value)
    else
      add_to_tree(Node.new(node_value), @root)
    end
  end

  def add_to_tree(node, parent)
    return node if parent.nil?

    node.parent = parent
    if node.value < parent.value
      parent.left_child = add_to_tree(node, parent.left_child)
    else
      parent.right_child = add_to_tree(node, parent.right_child)
    end
    parent
  end


  ######################################

  # Provide an array of the values in the BST when the BST is traversed inorder
  def inorder
    tree_data = []
    tree_data = inorder_traverse(@root, tree_data)
  end

  # Helper method to traverse the BST in order
  def inorder_traverse(node, data)
    return data if node.nil?
    inorder_traverse(node.left_child, data)
    data << node.value
    inorder_traverse(node.right_child, data)
  end

  # Display the nodes of the BST as they are visited in order
  def inorder_display
    puts "ROOT: #{@root.value}\n"
    inorder_display_helper @root
  end

  # Helper method to display nodes (with Node's to_s) of BST in order 
  def inorder_display_helper node
    return nil if node.nil?
    inorder_display_helper(node.left_child)
    puts node.to_s
    inorder_display_helper(node.right_child)
  end

  #######################################

end


def run_build_tree
  bst = BinarySearchTree.build_tree([7, 1, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
  puts "****** Begin Binary Search Tree Nodes ******"
  bst.inorder_display
  puts "******* End Binary Search Tree Nodes *******"
  puts "Inorder list of node values: #{bst.inorder}"

  # puts "Check BFS"
  # puts bst.breadth_first_search 5
  # puts bst.breadth_first_search 8
  # p bst.breadth_first_search 15 # => nil

  # puts "Check DFS"
  # puts bst.depth_first_search 5
  # puts bst.depth_first_search 8
  # p bst.depth_first_search 15 # => nil

  # puts "Check recursive DFS"
  # puts bst.dfs_rec 5
  # puts bst.dfs_rec 8
  # p bst.dfs_rec 15 # => nil
end

if ARGV[0] && ARGV[0].chomp.downcase =~ /test/
  run_build_tree
end