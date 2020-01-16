## Problem 8

#### Description

This problem was asked by Google.

A unival tree (which stands for "universal value") is a tree where all nodes under it have the same value.

Given the root to a binary tree, count the number of unival subtrees.

For example, the following tree has 5 unival subtrees:

```
   0
  / \
 1   0
    / \
   1   0
  / \
 1   1
 ```

### Solutions

```python
# Class Node
class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

# define function to examine a tree is universal or not
def is_unival_tree(root):
  if root == None:
    return(True)
  if root.left != None and root.left.value != root.value:
    return(False)
  if root.right != None and root.right.value != root.value:
    return(False)
  if is_unival_tree(root.left) and is_unival_tree(root.right):
    return(True)
  return(False)

# define a function to count the number of universal trees
def count_unival_trees(root):
  if root == None:
    return(0)
  total_count = count_unival_trees(root.left) + count_unival_trees(root.right)
  if is_unival_tree(root):
    total_count += 1
  return(total_count)


# test
root = Node(0) 
root.left = Node(1)
root.right = Node(0)
root.right.left = Node(1)
root.right.right = Node(0)
root.right.left.left = Node(1)
root.right.left.right = Node(1)
assert count_unival_trees(root) ==5
```
