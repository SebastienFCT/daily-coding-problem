## Description

This problem was asked by Morgan Stanley.

In Ancient Greece, it was common to write text with the first line going left to right, the second line going right to left, and continuing to go back and forth. This style was called "boustrophedon".

Given a binary tree, write an algorithm to print the nodes in boustrophedon order.

For example, given the following tree:

```
       1
    /     \
  2         3
 / \       / \
4   5     6   7
```

You should return `[1, 3, 2, 4, 5, 6, 7]`.

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
    
    init(value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    func boustrophedon() -> [Int] {
        
        var result: [Int] = []
        
        var nodes: [[Node]] = [[self]]
        var index = 0
        
        var next: [Node] = []
        if let left = left {
            next.append(left)
        }
        
        if let right = right {
            next.append(right)
        }
        
        if !next.isEmpty {
            nodes.append(next)
        }
        
        while index < nodes.count-1 {
            index += 1
            
            let current = nodes[index]
            var new: [Node] = []
            
            for node in current {
                if let left = node.left {
                    new.append(left)
                }
                
                if let right = node.right {
                    new.append(right)
                }
            }
            
            if !new.isEmpty {
                nodes.append(new)
            }
        }
        
        let mapped = nodes.map{ $0.map{ $0.value } }
        
        for i in 0..<mapped.count {
            if i % 2 == 0 {
                result.append(contentsOf: mapped[i])
            } else {
                result.append(contentsOf: mapped[i].reversed())
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_258Tests: XCTestCase {

    
    func test_example() {
        
        let root = Node(value: 1
            , left: Node(value: 2
                , left: Node(value: 4)
                , right: Node(value: 5))
            , right: Node(value: 3
                , left: Node(value: 6)
                , right: Node(value: 7))
        )
        
        let actual = root.boustrophedon()
        let expected = [1, 3, 2, 4, 5, 6, 7]
        
        XCTAssert(actual == expected)
    }

}
```