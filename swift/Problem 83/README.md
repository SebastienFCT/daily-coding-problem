## Description

This problem was asked by Google.

Invert a binary tree.

For example, given the following tree:

```
    a
   / \
  b   c
 / \  /
d   e f
```

should become:

```
  a
 / \
 c  b
 \  / \
  f e  d
```

## Solution

In swift this is straight forward:
 
- We create a node structure base of the tree
- We create a reverse function that reverse both children, the trick is to properly handly single children or no children

```swift
class Node<T> {
    var value: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(value: T, left: Node<T>?, right: Node<T>?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    func reverseChildren() {
        if let left = left, let right = right {
            self.left = right
            self.right = left
            
            self.left?.reverseChildren()
            self.right?.reverseChildren()
            
            return
        }
        
        if let right = right {
            self.left = right
            self.right = nil
            
            self.left?.reverseChildren()
            
            return
        }
        
        if let left = left {
            self.right = left
            self.left = nil
            
            return
        }
    }
}
```

## Test

```swift
class Problem_83Tests: XCTestCase {

    func test_example() {
        let tree = Node(value: "a", left: Node(value: "b", left: Node(value: "d", left: nil, right: nil), right: Node(value: "e", left: nil, right: nil)), right: Node(value: "c", left: nil, right: nil))
        
        tree.reverseChildren()
        
        XCTAssert(tree.left?.value == "c")
        XCTAssert(tree.right?.right?.value == "d")
    }

}
```