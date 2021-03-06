## Description

This problem was asked by Airbnb.

Given a linked list and a positive integer `k`, rotate the list to the right by `k` places.

For example, given the linked list `7 -> 7 -> 3 -> 5` and `k = 2`, it should become `3 -> 5 -> 7 -> 7`.

Given the linked list `1 -> 2 -> 3 -> 4 -> 5` and `k = 3`, it should become `3 -> 4 -> 5 -> 1 -> 2`.

## Solution

```swift
class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
    
    func rotate(by: Int) -> Node {
     
        var size = 1
        var copy = self
        
        while copy.next != nil {
            size += 1
            copy = copy.next!
        }
        
        let rest = size - (by % size)
        
        let root = self
        var current = self
        
        for _ in 1..<rest {
            if let next = current.next {
                current = next
            }
        }
        
        if let next = current.next {
            let tail = current
            tail.next = nil
            
            let head = next
            current = head
            
            while current.next != nil {
                current = current.next!
            }
            
            current.next = root
            return head
        } else {
         
            return root
        }
    }
}
```

## Test

```swift
class Problem_177Tests: XCTestCase {

    func test_example() {
        let ll1 = Node(value: 7, next: Node(value: 7, next: Node(value: 3, next: Node(value: 5, next: nil))))
        XCTAssert(ll1.rotate(by: 2).value == 3)
        
        let ll2 = Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: Node(value: 5, next: nil)))))
        XCTAssert(ll2.rotate(by: 3).value == 3)
    }

}
```