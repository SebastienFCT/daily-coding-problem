## Description

This problem was asked by Yahoo.

Write an algorithm that computes the reversal of a directed graph. For example, if a graph consists of `A -> B -> C`, it should become `A <- B <- C`.

## Solution

```swift
class Node {
    var value: String
    var next: Node?
    
    init(value: String) {
        self.value = value
        self.next = nil
    }
    
    init(value: String, next: Node?) {
        self.value = value
        self.next = next
    }
    
    func reverse() -> Node {
        
        var current: Node? = self
        var nodes: [Node] = [current!]
        
        while current!.next != nil {
            nodes.append(current!.next!)
            current = current!.next
        }
        
        var root: Node? = nil
        var node: Node? = nil
        
        nodes.reversed().forEach { (item) in
            if root == nil {
                root = item
                node = item
            } else {
                node!.next = item
                node = node!.next
            }
        }
        
        node?.next = nil
        
        return root!
    }
    
    var view: String {
        var current: Node? = self
        var result = "\(current!.value)"
        
        while current?.next != nil {
            result += "->\(current!.next!.value)"
            current = current!.next
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_218Tests: XCTestCase {

    func test_example() {
        let current = Node(value: "A", next: Node(value: "B", next: Node(value: "C")))
        let reversed = current.reverse()
        
        let expected = "C->B->A"
        let actual = reversed.view
        
        XCTAssert(actual == expected)
    }

}
```