## Description

This problem was asked by Apple.

Implement a queue using two stacks. Recall that a queue is a FIFO (first-in, first-out) data structure with the following methods: `enqueue`, which inserts an element into the queue, and `dequeue`, which removes it.

## Solution

```swift
struct FIFO {
    var stack1: [Any]
    var stack2: [Any]
    
    mutating func enqueue(item: Any) {
        stack1.insert(item, at: 0)
    }
    
    mutating func dequeue() {
        // Insert each element in the other stack, so the order is reversed
        for item in stack1 {
            stack2.insert(item, at: 0)
        }
        
        // Clear the first stack
        stack1 = []
        
        // Remove the first element of the second stack (that's the first element that was inserted in the stack 1
        stack2.removeFirst()
        
        // Reverse back the element to stack 1 so that the next ones can be inserted
        for item in stack2 {
            stack1.insert(item, at: 0)
        }
        
        stack2 = []
    }
}
```

## Test

```swift
class Problem_53Tests: XCTestCase {

    func test_example() {
        var fifo = FIFO(stack1: [], stack2: [])
        
        fifo.enqueue(item: "Hello World")
        fifo.enqueue(item: 1)
        print(fifo.stack1)
        fifo.dequeue()
        print(fifo.stack1)
        fifo.enqueue(item: ["foo" : "bar"])
        print(fifo.stack1)
    }

}
```