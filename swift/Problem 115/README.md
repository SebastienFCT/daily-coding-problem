## Description

This problem was asked by Google.

Given two non-empty binary trees `s` and `t`, check whether tree `t` has exactly the same structure and node values with a subtree of `s`. A subtree of `s` is a tree consists of a node in `s` and all of this node's descendants. The tree `s` could also be considered as a subtree of itself.

## Solution

```swift
class Node {
    var value: String
    var left: Node?
    var right: Node?
    
    init(value: String, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    convenience init(value: String) {
        self.init(value: value, left: nil, right: nil)
    }
    
    func includes(node: Node) -> Bool {
        if self == node {
            return true
        }
        
        if let left = left {
            if left.includes(node: node) {
                return true
            }
        }
        
        if let right = right {
            if right.includes(node: node) {
                return true
            }
        }
        
        return false
    }
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        if lhs.value != rhs.value {
            return false
        }
        
        if let lhsleft = lhs.left {
            guard let rhsleft = rhs.left else {
                return false
            }
            
            if lhsleft != rhsleft {
                return false
            }
        } else {
            if let _ = rhs.left {
                return false
            }
        }
        
        if let lhsright = lhs.right {
            guard let rhsright = rhs.right else {
                return false
            }
            
            if lhsright != rhsright {
                return false
            }
        } else {
            if let _ = rhs.right {
                return false
            }
        }
        
        return true
    }
}
```

## Test

```swift
class Problem_115Tests: XCTestCase {

    func test_node_inclusion() {
        let root = Node(value: "root")
        
        let l = Node(value: "l")
        root.left = l
        
        let ll = Node(value: "ll")
        l.left = ll
        let lr = Node(value: "lr")
        l.right = lr
        let lll = Node(value: "lll")
        ll.left = lll
        let llr = Node(value: "llr")
        ll.right = llr
        
        let r = Node(value: "r")
        root.right = r
        
        XCTAssertTrue(root.includes(node: lr))
    }
    
    func test_node_non_inclusion() {
        let root = Node(value: "root")
        
        let l = Node(value: "l")
        root.left = l
        
        let ll = Node(value: "ll")
        l.left = ll
        let lr = Node(value: "lr")
        l.right = lr
        let lll = Node(value: "lll")
        ll.left = lll
        let llr = Node(value: "llr")
        ll.right = llr
        
        let r = Node(value: "r")
        root.right = r
        
        let otherNode = Node(value: "test", left: Node(value: "testLeft"), right: Node(value: "testRight"))
        
        XCTAssertFalse(root.includes(node: otherNode))
    }

}
```