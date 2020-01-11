## Description

This problem was asked by Microsoft.

Suppose an arithmetic expression is given as a binary tree. Each leaf is an integer and each internal node is one of '+', '−', '∗', or '/'.

Given the root to such a tree, write a function to evaluate it.

For example, given the following tree:

```
    *
   / \
  +    +
 / \  / \
3  2  4  5
```

You should return 45, as it is (3 + 2) * (4 + 5).

## Solution

```swift
class Problem_50Tests: XCTestCase {

    class Problem_50Tests: XCTestCase {
        
        func test_example() {
            let tree = Node(operation: "*")
            
            let left = Node(operation: "+")
            let right = Node(operation: "+")
            
            let leftleft = Node(value: 3)
            let leftright = Node(value: 2)
            let rightleft = Node(value: 4)
            let rightright = Node(value: 5)
            
            left.left = leftleft
            left.right = leftright
            right.left = rightleft
            right.right = rightright
            
            tree.left = left
            tree.right = right
            
            XCTAssert(tree.getValue() == 45)
        }
        
    }

}
```

## Test

```swift
class Problem_50Tests: XCTestCase {

    func test_example() {
        let tree = Node(operation: "*")
        
        let left = Node(operation: "+")
        let right = Node(operation: "+")
        
        let leftleft = Node(value: 3)
        let leftright = Node(value: 2)
        let rightleft = Node(value: 4)
        let rightright = Node(value: 5)
        
        left.left = leftleft
        left.right = leftright
        right.left = rightleft
        right.right = rightright
        
        tree.left = left
        tree.right = right
        
        XCTAssert(tree.getValue() == 45)
    }

}
```