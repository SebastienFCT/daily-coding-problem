## Description

This problem was asked by Netflix.

A Cartesian tree with sequence `S` is a binary tree defined by the following two properties:

- It is heap-ordered, so that each parent value is strictly less than that of its children.
- An in-order traversal of the tree produces nodes with values that correspond exactly to S.
For example, given the sequence `[3, 2, 6, 1, 9]`, the resulting Cartesian tree would be:

```
      1
    /   \   
  2       9
 / \
3   6
```

Given a sequence `S`, construct the corresponding Cartesian tree.

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
}


extension Array where Element == Int {
    
    func toTree(next: Node?) -> Node? {
        
        if isEmpty {
            return next
        }
        
        guard let last = next else {
            return Array(suffix(count-1)).toTree(next: Node(value: self[0]))
        }
        
        let node = Node(value: self[0])
        
        if last.value > node.value {
            node.left = last
            return Array(suffix(count-1)).toTree(next: node)
        }
        
        last.right = node
        return Array(suffix(count-1)).toTree(next: last)
    }
}
```

## Tests

```swift
class Problem_326Tests: XCTestCase {

    func test_example() {
        
        let tree = [3, 2, 6, 1, 9].toTree(next: nil)
        
        XCTAssert(tree?.value == 1)
        XCTAssert(tree?.left?.value == 2)
        XCTAssert(tree?.right?.value == 9)
        XCTAssert(tree?.left?.left?.value == 3)
        XCTAssert(tree?.left?.right?.value == 6)
    }

}
```