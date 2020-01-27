## Description

This problem was asked by PayPal.

Given a binary tree, determine whether or not it is height-balanced. A height-balanced binary tree can be defined as one in which the heights of the two subtrees of any node never differ by more than one.

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
    
    func height() -> Int {
        
        var leftH = 1
        var rightH = 1
        
        if let left = left {
            leftH += left.height()
        }
        
        if let right = right {
            rightH += right.height()
        }
        
        return max(leftH, rightH)
    }
    
    func isHeightBalanced() -> Bool {
        
        var leftH = 0
        var rightH = 0
        
        if let left = left {
            if !left.isHeightBalanced() {
                return false
            }
            
            leftH = left.height()
        }
        
        if let right = right {
            if !right.isHeightBalanced() {
                return false
            }
            
            rightH = right.height()
        }
        
        return abs(leftH-rightH) <= 1
    }
}
```

## Tests

```swift
class Problem_247Tests: XCTestCase {

    func test_height_balanced_binary_tree() {
        
        
        let root = Node(value: 0)
        
        let l = Node(value: 1)
        
        let ll = Node(value: 11)
        l.left = ll
        root.left = l
        
        let r = Node(value: 2)
        
        let rl = Node(value: 21)
        let rr = Node(value: 22)
        r.left = rl
        r.right = rr
        
        let rrl = Node(value: 221)
        rr.right = rrl
        
        root.right = r
        
        XCTAssertTrue(root.isHeightBalanced())
    }
    
    func test_height_unbalanced_binary_tree() {
        
        
        let root = Node(value: 0)
        
        let l = Node(value: 1)
        
        root.left = l
        
        let r = Node(value: 2)
        
        let rl = Node(value: 21)
        let rr = Node(value: 22)
        
        let rrl = Node(value: 221)
        rr.right = rrl
        
        r.left = rl
        r.right = rr
        
        root.right = r
        
        XCTAssertFalse(root.isHeightBalanced())
    }

}
```