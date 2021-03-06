## Description

This problem was asked by Two Sigma.
This problem was asked by Google.

Given the sequence of keys visited by a postorder traversal of a binary search tree, reconstruct the tree.

For example, given the sequence `2, 4, 3, 8, 7, 5`, you should construct the following tree:

```
    5
   / \
  3   7
 / \   \
2   4   8
```

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
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    static func buildTree(postorderedTraversedKeys: [Int]) -> Node? {
        if postorderedTraversedKeys.isEmpty {
            return nil
        }
        
        if postorderedTraversedKeys.count == 1 {
            return Node(value: postorderedTraversedKeys[0])
        }
        
        var copy = postorderedTraversedKeys
        let rootVal = copy.removeLast()
        let node = Node(value: rootVal)
        
        if copy.count == 1 {
            if copy[0] > rootVal {
                node.right = Node(value: copy[0])
            } else {
                node.left = Node(value: copy[0])
            }
            
            return node
        }
        
        var mid = 0
        
        for index in stride(from: copy.count-1, to: -1, by: -1) {
            if copy[index] < rootVal {
                mid = index
                break
            }
        }
        
        let leftValues = Array(copy.prefix(mid+1))
        let rightValues = Array(copy.suffix(copy.count-mid-1))
        
        node.left = buildTree(postorderedTraversedKeys: leftValues)
        node.right = buildTree(postorderedTraversedKeys: rightValues)
        
        return node
    }

}
```

## Test

```swift
class Problem_179Tests: XCTestCase {

    func test_example() {
        let root = Node.buildTree(postorderedTraversedKeys: [2,4,3,8,7,5])
        
        XCTAssert(root?.value == 5)
        XCTAssert(root?.left?.value == 3)
        XCTAssert(root?.left?.left?.value == 2)
        XCTAssert(root?.left?.right?.value == 4)
        XCTAssert(root?.right?.value == 7)
        XCTAssertNil(root?.right?.left?.value)
        XCTAssert(root?.right?.right?.value == 8)
    }

}
```