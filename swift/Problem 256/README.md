## Description

This problem was asked by Fitbit.

Given a linked list, rearrange the node values such that they appear in alternating `low -> high -> low -> high` ... form. For example, given `1 -> 2 -> 3 -> 4 -> 5`, you should return `1 -> 3 -> 2 -> 5 -> 4`.

## Solution

```swift
class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
        self.next = nil
    }
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
    
    func alternateValues() -> Node {
        
        let nodes = allNodes()
        let sorted = nodes.sorted{ $0.value < $1.value }
        
        let root = sorted[0]
        var current = root
        
        var ascending = false
        var index = 2
        
        while index < sorted.count {
            let next = sorted[index]
            current.next = next
            current = next
            
            if ascending {
                index += 3
            } else {
                index -= 1
            }
            
            ascending.toggle()
        }
        
        if index < sorted.count-1 {
            let tail = sorted.last!
            tail.next = nil
            current.next = tail
        } else {
            current.next = nil
        }
        
        return root
    }
    
    func allNodes() -> [Node] {
        
        var result: [Node] = []
        
        result.append(self)
        
        if let next = next {
            result.append(contentsOf: next.allNodes())
        }
        
        return result
    }
    
    func forPrinting() -> String {
        
        var result = "\(value)"
        
        if let next = next {
            result = "\(result)->\(next.forPrinting())"
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_256Tests: XCTestCase {

    func test_example() {
        let root = Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: Node(value: 5)))))
     
        XCTAssert(root.forPrinting() == "1->2->3->4->5")
        XCTAssert(root.alternateValues().forPrinting() == "1->3->2->5->4")
    }
    
    func test_example_2() {
        let root = Node(value: 4, next: Node(value: 1, next: Node(value: 3, next: Node(value: 2, next: Node(value: 5)))))
     
        XCTAssert(root.forPrinting() == "4->1->3->2->5")
        XCTAssert(root.alternateValues().forPrinting() == "1->3->2->5->4")
    }

}
```