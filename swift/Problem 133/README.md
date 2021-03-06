## Description

This problem was asked by Amazon.

Given a node in a binary search tree, return the next bigger element, also known as the inorder successor.

For example, the inorder successor of 22 is 30.

```
   10
  /  \
 5    30
     /  \
   22    35
```

You can assume each node has a parent pointer.


## Solution

```swift
class Node {
    var value: Int
    var parent: Node?
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
        self.parent = nil
        self.left = nil
        self.right = nil
    }
    
    init(value: Int, parent: Node?, left: Node?, right: Node?) {
        self.value = value
        self.parent = parent
        self.left = left
        self.right = right
    }
    
    func inOrderSuccessor() -> Node? {
        
        var candidates: [Node] = []
        
        candidates.append(contentsOf: children())
        candidates.append(contentsOf: parents())
        
        let filteredAndSorted = candidates.filter{ $0.value > self.value }.sorted{ $0.value < $1.value }
        
        return filteredAndSorted.first
    }
    
    private func children() -> [Node] {
        var result: [Node] = []
        
        if let left = left {
            result.append(left)
            result.append(contentsOf: left.children())
        }
        
        if let right = right {
            result.append(right)
            result.append(contentsOf: right.children())
        }
        
        return result
    }
    
    private func parents() -> [Node] {
        var result: [Node] = []
        
        if let parent = parent {
            result.append(parent)
            result.append(contentsOf: parent.parents())
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_133Tests: XCTestCase {

    func test_example() {
        let root = Node(value: 10)
        let l = Node(value: 5)
        let r = Node(value: 30)
        let rl = Node(value: 22)
        let rr = Node(value: 35)
        
        root.left = l
        l.parent = root
        
        root.right = r
        r.parent = root
        
        r.left = rl
        rl.parent = r
        
        r.right = rr
        rr.parent = r
        
        XCTAssert(rl.inOrderSuccessor()?.value == 30)
    }

}
```