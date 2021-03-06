## Description

This problem was asked by Google.

A quack is a data structure combining properties of both stacks and queues. It can be viewed as a list of elements written left to right such that three operations are possible:

- `push(x)`: add a new item x to the left end of the list
- `pop()`: remove and return the item on the left end of the list
- `pull()`: remove the item on the right end of the list.

Implement a quack using three stacks and O(1) additional memory, so that the amortized time for any push, pop, or pull operation is `O(1)`.

## Solution

```swift
class Node<T> {
    var value: T
    var previous: Node?
    var next: Node?
    
    init(value: T) {
        self.value = value
        self.previous = nil
        self.next = nil
    }
}

struct Quack<T: Equatable> {
    var root: Node<T>?
    var queue: Node<T>?
    
    mutating func push(value: T) {
        
        if queue == nil {
            if root == nil {
                root = Node(value: value)
                queue = nil
            } else {
                queue = Node(value: value)
                
                root?.next = queue
                root?.previous = queue
                
                queue?.next = root
                queue?.previous = root
            }
        } else {
            if queue!.previous?.value != root?.value {
                let prev = queue!.previous!
                
                let node = Node(value: value)
                prev.next = node
                
                node.previous = prev
                node.next = queue
                
                queue?.previous = node
            } else {
                
                let node = Node(value: value)
                node.previous = root
                node.next = queue
                
                root?.next = node
                queue?.previous = node
            }
        }
    }
    
    mutating func pop() -> Node<T>? {
        
        guard root != nil else {
            return nil
        }
        
        if queue != nil {
            let next = root!.next
            next?.previous = queue!
            
            let tmp = root
            root = next
            
            return tmp
        } else {
            let tmp = root
            root = nil
            
            return tmp
        }
    }
    
    mutating func pull() -> Node<T>? {
        
        guard queue != nil else {
            return nil
        }
        
        if root != nil {
            let previous = queue!.previous
            previous?.next = root
            
            let tmp = queue
            queue = previous
            
            return tmp
        } else {
            let tmp = queue
            queue = nil
            
            return tmp
        }
    }
}
```