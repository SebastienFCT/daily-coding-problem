## Description

This problem was asked by LinkedIn.

Determine whether a tree is a valid binary search tree.

A binary search tree is a tree with two children, left and right, and satisfies the constraint that the key in the left child must be less than or equal to the root and the key in the right child must be greater than or equal to the root.

## Solution

```swift
class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    func isValidBinaryTree() -> Bool {
        if let left = left {
            if left.value > value {
                return false
            }
        }
        
        if let right = right {
            if right.value < value {
                return false
            }
        }
        
        if left == nil && right == nil {
            return true
        }
        
        if left != nil && right != nil {
            return left!.isValidBinaryTree() && right!.isValidBinaryTree()
        }
        
        if left != nil {
            return left!.isValidBinaryTree()
        }
        
        if right != nil {
            return right!.isValidBinaryTree()
        }
        
        return true
    }
}
```

## Test

```swift
class Problem_89Tests: XCTestCase {

    func test_validTree() {
        let tree = Node(value: 0, left: Node(value: -1, left: Node(value: -2, left: nil, right: nil), right: nil), right: Node(value: 1, left: nil, right: Node(value: 2, left: nil, right: nil)))
        
        XCTAssert(tree.isValidBinaryTree() == true)
    }
    
    func test_invalidTree() {
        let tree = Node(value: 0, left: Node(value: -1, left: Node(value: -2, left: nil, right: nil), right: nil), right: Node(value: 1, left: nil, right: Node(value: -5, left: nil, right: nil)))
        
        XCTAssert(tree.isValidBinaryTree() == false)
    }

}
```