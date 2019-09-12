## Description

This problem was asked by Facebook.

Given a binary tree, return all paths from the root to leaves.

For example, given the tree:

```
   1
  / \
 2   3
    / \
   4   5
```

Return `[[1, 2], [1, 3, 4], [1, 3, 5]]`.

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
    
    func paths() -> [[Int]] {
        var result: [[Int]] = []
        
        if left == nil && right == nil {
            return [[value]]
        }
        
        if let left = left {
            for subPath in left.paths() {
                result.append([value] + subPath)
            }
        }
        
        if let right = right {
            for subPath in right.paths() {
                result.append([value] + subPath)
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_110Tests: XCTestCase {

    func test_simple_1() {
        let root = Node(value: 1, left: Node(value: 2, left: nil, right: nil), right: Node(value: 3, left: Node(value: 4, left: nil, right: nil), right: nil))
        XCTAssert(root.paths() ==  [[1, 2], [1, 3, 4]])
    }
    
    func test_example() {
        let root = Node(value: 1, left: Node(value: 2, left: nil, right: nil), right: Node(value: 3, left: Node(value: 4, left: nil, right: nil), right: Node(value: 5, left: nil, right: nil)))
        XCTAssert(root.paths() ==  [[1, 2], [1, 3, 4], [1, 3, 5]])
    }

}
```