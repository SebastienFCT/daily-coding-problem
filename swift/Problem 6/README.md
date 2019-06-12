### Description

This problem was asked by Google.

An XOR linked list is a more memory efficient doubly linked list. Instead of each node holding `next` and `prev` fields, it holds a field named `both`, which is an XOR of the next node and the previous node. Implement an XOR linked list; it has an `add(element)` which adds the element to the end, and a `get(index)` which returns the node at index.

If using a language that has no pointers (such as Python), you can assume you have access to `get_pointer` and `dereference_pointer` functions that converts between nodes and memory addresses.

### Solution

```swift
// This won't compile, the logic is well explained at: https://www.techiedelight.com/xor-linked-list-overview-implementation-c-cpp/

class Node {
    var data: String
    var link: UnsafeMutablePointer<Node>? = nil
    
    init(data: String) {
        self.data = data
        self.link = UnsafeMutablePointer<Node>(&self)
    }
    
    func traverse(head: Node) {
        var current: Node? = head
        var prev: Node? = nil
        var next: Node? = nil
        
        while current != nil {
            next = xor(a: prev, b: current)
            prev = current
            current = next
        }
    }
    
    func insert(head: Node, data: String) {
        var node = Node(data: data)
        node.link = xor(a: head, b: nil)
        
        if (head != nil) {
            head.link = xor(a: node, b: xor(a: head.link, b: nil))
        }
    }
    
    // MARK: - Utility
    
    func xor(a: Node?, b: Node?) -> Node {
        let xor = UnsafeMutablePointer<Node>(&a) ^ UnsafeMutablePointer<Node>(&b)
        let node = UnsafeMutablePointer<Node>.allocate(capacity: 8)
        
        return node.pointee
    }
}

```