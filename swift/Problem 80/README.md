## Description

This problem was asked by Google.

Given the root of a binary tree, return a deepest node. For example, in the following tree, return d.

```
    a
   / \
  b   c
 /
d
```

## Solution

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
    
    func findDeepestNode() -> (node: Node<T>, level: Int) {
        let possibilities = nextLevels(currentLevel: 0)
        
        // While force un-wrapping isn't recommended, it's enough for the demonstration as we know that we need the root to call the function from and it would return itself in the worst case
        return possibilities.sorted{ $0.level > $1.level }.first!
    }
    
    // Recursive function that keep tracks of the current level of the node
    private func nextLevels(currentLevel: Int) -> [(node: Node<T>, level: Int)] {
        var result: [(node: Node<T>, level: Int)] = []
        
        // If there are no children, this is the maximum level (for this branch)
        if left == nil && right == nil {
            result.append((node: self, level: currentLevel))
            return result
        }
        
        // Otherwise, ask the children if there are other levels
        if let left = left {
            result.append(contentsOf: left.nextLevels(currentLevel: currentLevel+1))
        }
        
        if let right = right {
            result.append(contentsOf: right.nextLevels(currentLevel: currentLevel+1))
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_80Tests: XCTestCase {

    func test_example() {
        let input = Node(value: "a", left: Node(value: "b", left: Node(value: "d", left: nil, right: nil), right: nil), right: Node(value: "c", left: nil, right: nil))
        
        XCTAssert(input.findDeepestNode().node.value == "d")
        XCTAssert(input.findDeepestNode().level == 2)
    }

}
```