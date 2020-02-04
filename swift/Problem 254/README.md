## Description

This problem was asked by Yahoo.

Recall that a full binary tree is one in which each node is either a leaf node, or has two children. Given a binary tree, convert it to a full one by removing nodes with only one child.

For example, given the following tree:

```
         0
      /     \
    1         2
  /            \
3                 4
  \             /   \
    5          6     7
```

You should convert it to:


```
     0
  /     \
5         4
        /   \
       6     7
```

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
    
    func toBinaryTree() -> Node {
        
        let copy = self
        
        if let left = left, let right = right {
            copy.left = left.toBinaryTree()
            copy.right = right.toBinaryTree()
            
            return copy
        } else {
            if let left = left {
                return left.toBinaryTree()
            }
            
            if let right = right {
                return right.toBinaryTree()
            }
        }
        
        return copy
    }
}
```

## Tests

```swift
class Problem_254Tests: XCTestCase {

    func test_example() {
        
        let root = Node(value: 0)
        
        let l = Node(value: 1)
        let ll = Node(value: 3)
        let llr = Node(value: 5)
        
        ll.right = llr
        l.left = ll
        root.left = l
        
        let r = Node(value: 2)
        let rr = Node(value: 4)
        let rrl = Node(value: 6)
        let rrr = Node(value: 7)
        
        rr.left = rrl
        rr.right = rrr
        r.right = rr
        root.right = r
        
        let actual = root.toBinaryTree()
        
        XCTAssert(actual.value == 0)
        XCTAssert(actual.left?.value == 5)
        XCTAssertNil(actual.left?.left)
        XCTAssertNil(actual.left?.right)
        
        XCTAssert(actual.right?.value == 4)
        XCTAssert(actual.right?.left?.value == 6)
        XCTAssertNil(actual.right?.left?.left)
        XCTAssertNil(actual.right?.left?.right)
        XCTAssert(actual.right?.right?.value == 7)
        XCTAssertNil(actual.right?.right?.left)
        XCTAssertNil(actual.right?.right?.right)
    }

}
```