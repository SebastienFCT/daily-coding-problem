## Description

This question was asked by BufferBox.

Given a binary tree where all nodes are either `0` or `1`, prune the tree so that subtrees containing all `0`s are removed.

For example, given the following tree:

```
   0
  / \
 1   0
    / \
   1   0
  / \
 0   0
```

should be pruned to:

```
   0
  / \
 1   0
    /
   1
```

We do not remove the tree at the root or its left child because it still has a `1` as a descendant.

## Solution

```swift
class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    func prune() -> Node? {
        if let left = left {
            self.left = left.prune()
        }
        
        if let right = right {
            self.right = right.prune()
        }
        
        if left == nil && right == nil {
            if value == 0 {
                return nil
            }
            
            return self
        }
        
        return self
    }
}
```

## Test

```swift
class Problem_146Tests: XCTestCase {

    func test_example() {
        let root = Node(value: 0)
        
        let l = Node(value: 1)
        root.left = l
        
        let r = Node(value: 0)
        root.right = r
        
        let rl = Node(value: 1)
        r.left = rl
        
        let rr = Node(value: 0)
        r.right = rr
        
        let rrl = Node(value: 0)
        rr.left = rrl
        
        let rrr = Node(value: 0)
        rr.right = rrr
        
        XCTAssert(root.left?.value == 1)
        XCTAssert(root.right?.value == 0)
        XCTAssert(root.right?.right?.value == 0)
        
        let pruned = root.prune()
        
        XCTAssert(pruned?.value == root.value)
        XCTAssert(pruned?.left?.value == 1)
        XCTAssert(pruned?.right?.value == 0)
        XCTAssert(pruned?.right?.right?.value == nil)
    }

}
```