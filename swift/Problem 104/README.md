## Description

Determine whether a doubly linked list is a palindrome. What if it’s singly linked?

For example, `1 -> 4 -> 3 -> 4 -> 1` returns True while `1 -> 4` returns False

## Solution

```swift
class Node {
    var value: Int
    var previous: Node?
    var next: Node?
    
    init(value: Int, previous: Node?, next: Node?) {
        self.value = value
        self.previous = previous
        self.next = next
    }
}

struct LinkedList {
    var root: Node?
    
    mutating func push(node: Node) {
        if let root = root {
            if let previous = root.previous {
                previous.next = node
                node.previous = previous
            } else {
                root.next = node
                node.previous = root
            }
        } else {
            root = node
        }
    }
    
    func isPalindrome() -> Bool {
        
        var entries: [Int] = []
        
        if var current = root {
            entries.append(current.value)
            
            while current.next != nil {
                current = current.next!
                entries.append(current.value)
            }
        }
        
        if entries.count % 2 == 0 {
            return Array(entries.prefix(entries.count/2)) == Array(entries.suffix(entries.count/2)).reversed()
        } else {
            return Array(entries.prefix(entries.count/2-1)) == Array(entries.suffix(entries.count/2-1).reversed())
        }
    }
}
```

## Test

```swift
class Problem_104Tests: XCTestCase {

    func test_example_1() {
        let node1 = Node(value: 1, previous: nil, next: nil)
        let node2 = Node(value: 4, previous: nil, next: nil)
        let node3 = Node(value: 3, previous: nil, next: nil)
        let node4 = Node(value: 4, previous: nil, next: nil)
        let node5 = Node(value: 1, previous: nil, next: nil)
        
        var linkedList = LinkedList(root: nil)
        linkedList.push(node: node1)
        linkedList.push(node: node2)
        linkedList.push(node: node3)
        linkedList.push(node: node4)
        linkedList.push(node: node5)
        
        XCTAssert(linkedList.isPalindrome() == true)
    }
    
    func test_example_2() {
        let node1 = Node(value: 1, previous: nil, next: nil)
        let node2 = Node(value: 4, previous: nil, next: nil)
        
        var linkedList = LinkedList(root: nil)
        linkedList.push(node: node1)
        linkedList.push(node: node2)
        
        XCTAssert(linkedList.isPalindrome() == false)
    }

}
```