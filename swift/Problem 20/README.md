## Description

This problem was asked by Google.

Given two singly linked lists that intersect at some point, find the intersecting node. The lists are non-cyclical.

For example, given `A = 3 -> 7 -> 8 -> 10` and `B = 99 -> 1 -> 8 -> 10`, return the node with value `8`.

In this example, assume nodes with the same value are the exact same node objects.

Do this in `O(M + N)` time (where `M` and `N` are the lengths of the lists) and constant space.

## Solution

```swift
class Node: Equatable, Comparable, Hashable {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
    
    // We assume that the same value means the same node
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.value < rhs.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }
}

func commonNode(lhs: Node, rhs: Node) -> Node? {
    var set = Set<Node>()
    
    var currentNode: Node? = nil
    currentNode = lhs
    
    while currentNode != nil {
        if set.insert(currentNode!).inserted {
            currentNode = currentNode!.next
        }
    }
    
    currentNode = rhs
    
    while currentNode != nil {
        if set.insert(currentNode!).inserted {
            currentNode = currentNode!.next
        } else {
            return currentNode!
        }
    }
    
    return nil
}
```

## Test

```swift
class Problem_20Tests: XCTestCase {

    func test() {
        let input1 = Node(value: 3, next: Node(value: 7, next: Node(value: 8, next: Node(value: 10, next: nil))))
        let input2 = Node(value: 99, next: Node(value: 1, next: Node(value: 8, next: Node(value: 10, next: nil))))
        
        XCTAssert(commonNode(lhs: input1, rhs: input2)!.value == 8)
    }

}
```