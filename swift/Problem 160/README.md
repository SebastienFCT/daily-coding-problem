## Description

This problem was asked by Uber.

Given a tree where each edge has a weight, compute the length of the longest path in the tree.

For example, given the following tree:

```
   a
  /|\
 b c d
    / \
   e   f
  / \
 g   h
```

and the weights: `a-b: 3, a-c: 5, a-d: 8, d-e: 2, d-f: 4, e-g: 1, e-h: 1`, the longest path would be `c -> a -> d -> f`, with a length of 17.

The path does not have to pass through the root, and each node can have any amount of children.

## Solution - Failed

```swift
class Node {
    
    var value: String
    var weight: Int
    var children: [Node]
    
    init(value: String, weight: Int, children: [Node]) {
        self.value = value
        self.weight = weight
        self.children = children
    }
    
    func longestPath() -> (path: [Node], totalWeight: Int)? {
        
        let paths = allPath(from: [])
        var pathAndWeights: [(path: [Node], totalWeight: Int)] = []
        
        for path in paths {
            
            var pathAndWeight: (path: [Node], totalWeight: Int) = ([], 0)
            
            for node in path {
                pathAndWeight.path.append(node)
                pathAndWeight.totalWeight += node.weight
            }
            
            pathAndWeights.append(pathAndWeight)
        }
        
        print(pathAndWeights)
        
        let sorted = pathAndWeights.sorted{ $0.totalWeight > $1.totalWeight }
        
        if let longest = sorted.first {
            return longest
        }
        
        return nil
    }
    
    func allPath(from: [Node]) -> [[Node]] {
        var result: [[Node]] = []
        if !from.isEmpty {
            result.append(from)
        }
        
        for child in children {
            var copy = from
            copy.append(self)
            
            result.append(contentsOf: child.allPath(from: copy))
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_160Tests: XCTestCase {

    func test_example() {
        let root = Node(value: "a", weight: 0, children: [
            Node(value: "b", weight: 3, children: []),
            Node(value: "c", weight: 5, children: []),
            Node(value: "d", weight: 8, children: [
                Node(value: "e", weight: 2, children: [
                    Node(value: "g", weight: 1, children: []),
                    Node(value: "h", weight: 1, children: [])
                ]),
                Node(value: "f", weight: 4, children: [])
            ])
        ])
        
        print(root.longestPath()?.totalWeight)
    }

}
```