### Description

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

### Solution

```swift
class Node {
    var val: Int
    var left: Node?
    var right: Node?
    
    init(val: Int, left: Node? = nil, right: Node? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    func isUnival(val: Int? = nil) -> Bool {
        if let val = val {
            if self.val != val {
                return false
            }
        }
        
        if left == nil && right == nil {
            return true
        } else {
            if let left = left, let right = right {
                return left.isUnival(val: self.val) && right.isUnival(val: self.val)
            }
            
            if left == nil {
                return right!.val == self.val
            }
            
            if right == nil {
                return left!.val == self.val
            }
        }
        
        return true
    }
    
    func countUnival() -> Int {
        return (isUnival() ? 1 : 0) + (left?.countUnival() ?? 0) + (right?.countUnival() ?? 0)
    }
}

```