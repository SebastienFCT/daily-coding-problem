## Description

This problem was asked by Amazon.

A tree is symmetric if its data and shape remain unchanged when it is reflected about the root node. The following tree is an example:

```
        4
      / | \
    3   5   3
  /           \
9              9
```

Given a `k`-ary tree, determine whether it is symmetric.

## Solution

```swift
class Node {
    var value: Int
    var children: [Node]
    
    init(value: Int) {
        self.value = value
        self.children = []
    }
    
    func orderedNodesPerLevel() -> [[Node]] {
        
        var result: [[Node]] = []
        
        var current = [self]
        
        while !current.isEmpty {
            result.append(current)
            
            var newRow: [Node] = []
            
            for node in current {
                newRow.append(contentsOf: node.children)
            }
            
            current = newRow
        }
        
        return result
    }
    
    func isSymmetric() -> Bool {
        
        let levels = orderedNodesPerLevel()
        for level in levels {
            let map = level.map{ $0.value }
            if !map.isSymetric() {
                return false
            }
        }
        
        return true
    }
}

extension Array where Element == Int {
    
    func isSymetric() -> Bool {
        for i in 0...count/2 {
            if self[i] != self[count-i-1] {
                return false
            }
        }
        
        return true
    }
}
```

## Tests

```swift
class Problem_237Tests: XCTestCase {

    func test_symetric_tree() {
        
        let root = Node(value: 4)
        
        let c1 = Node(value: 3)
        let c2 = Node(value: 5)
        let c3 = Node(value: 3)
        
        let cc1 = Node(value: 1)
        let cc2 = Node(value: 2)
        let cc3 = Node(value: 1)
        
        let cc4 = Node(value: 4)
        let cc5 = Node(value: 5)
        let cc6 = Node(value: 4)
        
        let cc7 = Node(value: 1)
        let cc8 = Node(value: 2)
        let cc9 = Node(value: 1)
        
        c1.children = [cc1, cc2, cc3]
        c2.children = [cc4, cc5, cc6]
        c3.children = [cc7, cc8, cc9]
        root.children = [c1, c2, c3]
        
        XCTAssertTrue(root.isSymmetric())
    }
    
    func test_asymetric_tree() {
        
        let root = Node(value: 4)
        
        let c1 = Node(value: 3)
        let c2 = Node(value: 2)
        let c3 = Node(value: 1)
        
        let cc1 = Node(value: 1)
        let cc2 = Node(value: 2)
        let cc3 = Node(value: 3)
        
        let cc4 = Node(value: 4)
        let cc5 = Node(value: 12)
        let cc6 = Node(value: 4)
        
        let cc7 = Node(value: -90)
        let cc8 = Node(value: 2)
        let cc9 = Node(value: 1)
        
        c1.children = [cc1, cc2, cc3]
        c2.children = [cc4, cc5, cc6]
        c3.children = [cc7, cc8, cc9]
        root.children = [c1, c2, c3]
        
        XCTAssertFalse(root.isSymmetric())
    }

}
```