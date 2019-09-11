# We are given a binary tree (with root node 'root'), a target node, 
# and an integer value k.

#	Return a list of the values of all nodes that have a distance k 
# from the target node.

# The entry method is defined as distance_k
# This method begins with an edge case check,
# then calls dfs.

# dfs starts at the root of the binary tree and turns it into
# a graph by adding an additional attribute 'parent' to
# each node. 

# lastly bfs is called on the graph to find all nodes with
# distance k from target node

# Time complexity O(n), n = number of nodes in tree
# Space complexity O(n)

class TreeNode
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @right, @left = nil, nil
  end
end

TreeNode.class_eval {
  attr_accessor :parent
}

def distance_k(root, target, k)
  return [ target.val ] if k == 0

  dfs(root)
  bfs(target, k)
end


def dfs(node)
  if node.left
    set_parent(node.left, node)
    dfs(node.left)
  end
  if node.right
    set_parent(node.right, node)
    dfs(node.right)
  end
end

def set_parent(child, parent)
  child.parent = parent
end


def bfs(target, k)
  queue, dist, children = [ target ], 1, []
  visited = Hash.new(false)
  visited[target] = true

  loop do
    while queue.length > 0
      node = queue.shift
      if node.left && visited[node.left] == false
        visited[node.left] = true
        children.push(node.left)
      end
      if node.right && visited[node.right] == false
        visited[node.right] = true
        children.push(node.right)
      end
      if node.parent && visited[node.parent] == false
        visited[node.parent] = true
        children.push(node.parent)
      end
    end

    queue = children
    dist += 1
    children = []
    break if dist == k
  end

  queue.map { |node| node.val }
end
