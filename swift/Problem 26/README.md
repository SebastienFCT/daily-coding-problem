## Description

This problem was asked by Google.

Given a singly linked list and an integer `k`, remove the `kth` last element from the list. `k` is guaranteed to be smaller than the length of the list.

The list is very long, so making more than one pass is prohibitively expensive.

Do this in constant space and in one pass.

## Solution

```swift
extension Node {
    
    func removeElementAt(_ index: Int) {
        var currentNode = self
        
        for _ in 0...index-2 {
            if let child = currentNode.node {
                currentNode = child
            } else {
                fatalError("index cannot be greater than the length of your list")
            }
        }
        
        guard let childNode = currentNode.node else  {
            fatalError("index cannot be greater than the length of your list")
        }
        
        if let grandChildNode = childNode.node {
            // if k < list length
            currentNode.node = grandChildNode
        } else {
            // if k == list length
            currentNode.node = nil
        }
    }
}

class Node {
    var value: String
    var node: Node?
    
    init(value: String) {
        self.value = value
        self.node = nil
    }
    
    init(value: String, node: Node?) {
        self.value = value
        self.node = node
    }
    
    func getElementAt(_ index: Int) -> Node {
        var currentNode = self
        
        for _ in 0...index-1 {
            if let child = currentNode.node {
                currentNode = child
            } else {
                fatalError("index cannot be greater than the length of your list")
            }
        }
        
        return currentNode
    }
}
```

## Tests

```swift
class Problem_26Tests: XCTestCase {

    func test_1() {
        let node = Node(value: "0", node: Node(value: "1", node: Node(value: "2", node: Node(value: "3", node: Node(value: "4", node: Node(value: "5", node: nil))))))
        
        XCTAssert(node.getElementAt(3).value == "3")
        node.removeElementAt(3)
        XCTAssert(node.getElementAt(3).value == "4")
    }

}
```