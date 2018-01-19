# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative "bst_node"
require 'byebug'

class BinarySearchTree
  attr_accessor :root
  def initialize(node = nil)
    @root = node
  end

  def insert(value)
    if @root
      if value >= @root.value
        if @root.right
          BinarySearchTree.new(@root.right).insert(value)
        else
          @root.right = BSTNode.new(value)
          @root.right.parent = @root
        end
      else
        if @root.left
          BinarySearchTree.new(@root.left).insert(value)   
        else
          @root.left = BSTNode.new(value)
          @root.left.parent = @root
        end
      end
    else
      @root = BSTNode.new(value)
    end
  end
  
  def find(value, tree_node = @root) 
    if tree_node.value == value 
      return tree_node 
    elsif value > tree_node.value 
      if tree_node.right 
        BinarySearchTree.new(tree_node.right).find(value)
      else 
        return nil
      end
    else 
      if tree_node.left
        BinarySearchTree.new(tree_node.left).find(value)
      else
        return nil 
      end
    end
  end

  def delete(value)
    target = BinarySearchTree.new(@root).find(value)
    parent = target.parent 
    if !target.right && !target.left
      if parent 
        if parent.right == target 
          parent.right = nil 
        elsif parent.left == target 
          parent.left = nil
        end
      else 
        @root = nil
      end
    elsif !!target.right ^ !!target.left
      if target.right 
        if parent 
          if parent.right == target 
            parent.right = target.right 
          else
            parent.left = target.right
          end
        else
          @root = target.right 
        end 
      else 
        target = target.left 
        if parent 
          if parent.right == target 
            parent.right = target.left 
          else
            parent.left = target.left
          end
        else
          @root = target.left 
        end 
      end
    else 
      replacement = BinarySearchTree.new(target.left).maximum
      if replacement.left 
        if replacement.parent.right == replacement 
          replacement.parent.right = replacement.left
        else 
          replacement.parent.left = replacement.left 
        end
      end
      replacement.right = target.right 
      replacement.left = target.left
      replacement.parent = target.parent 
      if parent.left == target 
        parent.left = replacement
      else 
        parent.right = replacement 
      end

    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    if tree_node.right 
      BinarySearchTree.new(tree_node.right).maximum
    else 
      return tree_node
    end
  end

  def depth(tree_node = @root)
    return 0 if !tree_node
    if (!tree_node.left && !tree_node.right) && (tree_node == @root)
      return 0
    elsif !tree_node.left && !tree_node.right
      return 1
    end
    if tree_node.left 
      return BinarySearchTree.new().depth(tree_node.left) + 1
    else 
      return BinarySearchTree.new().depth(tree_node.right) + 1 
    end 
  end 

  def is_balanced?(tree_node = @root)
   
    left_depth = 0
    right_depth = 0
    if tree_node.left 
      left_depth = BinarySearchTree.new().depth(tree_node.left)
      return false unless BinarySearchTree.new().is_balanced?(tree_node.left)
    end
    if tree_node.right 
      right_depth = BinarySearchTree.new().depth(tree_node.right)
      return false unless BinarySearchTree.new().is_balanced?(tree_node.right)
    end
    return false unless (left_depth - right_depth).abs < 2
    return true 
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

end
