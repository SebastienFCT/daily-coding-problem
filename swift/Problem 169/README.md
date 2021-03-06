## Description

This problem was asked by Google.

Given a linked list, sort it in O(n log n) time and constant space.

For example, the linked list `4 -> 1 -> -3 -> 99` should become `-3 -> 1 -> 4 -> 99`.

## Solution
    
```swift
class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
    
    func toArray() -> [Int] {
        var result: [Int] = []
        result.append(value)
        
        if let next = next {
            result.append(contentsOf: next.toArray())
        }
        
        return result
    }
    
    func sort() -> Node? {
        let sortedValues = toArray().sorted()
        
        var head: Node?
        var next: Node?
        
        for value in sortedValues {
            if head == nil {
                head = Node(value: value, next: nil)
            } else {
                if next == nil {
                    next = Node(value: value, next: nil)
                    head!.next = next
                } else {
                    next!.next = Node(value: value, next: nil)
                    next = next!.next
                }
            }
        }
        
        return head
    }
    
    func printList() -> String {
        var result = ""
        
        result += "\(value)"
        
        if let next = next {
            result += "->\(next.printList())"
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_169Tests: XCTestCase {

    func test_example() {
        let ll = Node(value: 4, next: Node(value: 1, next: Node(value: -3, next: Node(value: 99, next: nil))))
        XCTAssert(ll.sort()?.printList() == "-3->1->4->99")
    }

}
```