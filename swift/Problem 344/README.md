## Description

This problem was asked by Adobe.

You are given a tree with an even number of nodes. Consider each connection between a parent and child node to be an "edge". You would like to remove some of these edges, such that the disconnected subtrees that remain each have an even number of nodes.

For example, suppose your input was the following tree:

```
   1
  / \ 
 2   3
    / \ 
   4   5
 / | \
6  7  8
```

In this case, removing the edge `(3, 4)` satisfies our requirement.

Write a function that returns the maximum number of edges you can remove while still satisfying this requirement.

## Solution

```swift
class Node {
    var value: Int
    var children: [Node]
    
    init(value: Int, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    func countNodes() -> Int {
        
        return 1 + children.map({ $0.countNodes() }).reduce(0) { $0 + $1 }
    }
    
    func maxEdgeCutWithEvenSubtrees() -> Int {
        
        var result = 0
        
        for child in children {
            if child.countNodes() % 2 == 0 {
                result += 1
            }
            
            result += child.maxEdgeCutWithEvenSubtrees()
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_344Tests: XCTestCase {

    func test_example() {
        let input = Node(value: 1, children: [
            Node(value: 2, children: []),
            Node(value: 3, children: [
                Node(value: 4, children: [
                    Node(value: 6, children: []),
                    Node(value: 7, children: []),
                    Node(value: 8, children: [])
                ]),
                Node(value: 5, children: [])
            ]),
        ])
        
        let actual = input.maxEdgeCutWithEvenSubtrees()
        let expected = 2
        
        XCTAssert(actual == expected)
    }

}
```