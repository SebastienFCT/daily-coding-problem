## Description

This problem was asked by Twitter.

Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree. Assume that each node in the tree also has a pointer to its parent.

According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes v and w as the lowest node in T that has both v and w as descendants (where we allow a node to be a descendant of itself).”

## Solution

```swift
/*
 * For simplicity, we will identify the node by its integer value
 */
class Node {
    var value: Int
    var left: Node?
    var right: Node?
    var parent: Node?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
        self.parent = nil
    }
    
    func setLeftChild(node: Node?) {
        if let left = left {
            left.parent = nil
        }
        
        self.left = node
        
        node?.parent = self
    }
    
    func setRightChild(node: Node?) {
        if let right = right {
            right.parent = nil
        }
        
        self.right = node
        
        node?.parent = self
    }
}

// MARK: - Utilities

extension Node {
    func parents(base: [Node]) -> [Node] {
        if let parent = parent {
            return parent.parents(base: base + [self])
        }
        
        return base + [self]
    }
    
    func lca(with node: Node) -> Node? {
        let leftParents = self.parents(base: [])
        let rightParents = node.parents(base: [])
        
        for i in 0..<max(leftParents.count, rightParents.count) {
            if i <= leftParents.count {
                let current = leftParents[i]
                if rightParents.contains(where: { (aNode) -> Bool in
                    return aNode.value == current.value
                }) {
                    return current
                }
            }
            
            if i <= rightParents.count {
                let current = rightParents[i]
                if leftParents.contains(where: { (aNode) -> Bool in
                    return aNode.value == current.value
                }) {
                    return current
                }
            }
        }
        
        return nil
    }
}
```

## Test

```swift
class Problem_112Tests: XCTestCase {

    func test_parents_function() {
        let root = Node(value: 0)
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        let node4 = Node(value: 4)
        let node5 = Node(value: 5)
        let node6 = Node(value: 6)
        let node7 = Node(value: 7)
        let node8 = Node(value: 8)
        
        root.setLeftChild(node: node1)
        node1.setLeftChild(node: node3)
        node1.setRightChild(node: node4)
        
        root.setRightChild(node: node2)
        node2.setLeftChild(node: node5)
        node2.setRightChild(node: node6)
        
        node6.setLeftChild(node: node7)
        node7.setRightChild(node: node8)
        
        let node8Parents = node8.parents(base: [])
        XCTAssert(node8Parents.map{ $0.value } == [8, 7, 6, 2, 0])
    }
    
    func test_function_lca() {
        let root = Node(value: 0)
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node11 = Node(value: 11)
        let node12 = Node(value: 12)
        let node21 = Node(value: 21)
        let node22 = Node(value: 22)
        let node211 = Node(value: 211)
        let node212 = Node(value: 212)
        
        root.setLeftChild(node: node1)
        node1.setLeftChild(node: node11)
        node1.setRightChild(node: node12)
        root.setRightChild(node: node2)
        node2.setLeftChild(node: node21)
        node2.setRightChild(node: node22)
        node21.setLeftChild(node: node211)
        node21.setRightChild(node: node212)
        
        XCTAssert(node212.lca(with: node211)!.value == 21)
        XCTAssert(node22.lca(with: node212)!.value == 2)
    }

}
```