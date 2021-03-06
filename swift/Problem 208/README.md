## Description

This problem was asked by LinkedIn.

Given a linked list of numbers and a pivot `k`, partition the linked list so that all nodes less than `k` come before nodes greater than or equal to `k`.

For example, given the linked list `5 -> 1 -> 8 -> 0 -> 3` and `k = 3`, the solution could be `1 -> 0 -> 5 -> 8 -> 3`.

## Solution

```swift
class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node) {
        self.value = value
        self.next = next
    }
    
    init(value: Int) {
        self.value = value
        self.next = nil
    }
    
    func partition(by k: Int) -> Node? {
        var root = self
        var current: Node? = root
        
        while current?.next != nil {
            let next = current!.next!
            
            if next.value < k {
                current!.next = next.next
                next.next = root
                root = next
            }
            
            current = current!.next
        }
        
        return root
    }
    
    func printList() -> String {
        
        var result = ""
        
        var current: Node? = self
        
        while current != nil {
            if !result.isEmpty {
                result += "->"
            }
            
            result += "\(current!.value)"
            current = current!.next
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_208Tests: XCTestCase {

    func test_example() {
        let ll = Node(value: 5, next: Node(value: 1, next: Node(value: 8, next: Node(value: 0, next: Node(value: 3)))))
        
        XCTAssert(ll.partition(by: 3)!.printList() == "0->1->5->8->3")
    }

}
```