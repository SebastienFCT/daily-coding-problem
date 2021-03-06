## Description

This problem was asked by Amazon.

Given a linked list, remove all consecutive nodes that sum to zero. Print out the remaining nodes.

For example, suppose you are given the input `3 -> 4 -> -7 -> 5 -> -6 -> 6`. In this case, you should first remove `3 -> 4 -> -7`, then `-6 -> 6`, leaving only `5`.
## Solution

```swift
class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
    
    func toPrint() -> String {
        
        var result = "\(value)"
        
        if let next = next {
            result = "\(result)->\(next.toPrint())"
        }
        
        return result
    }
}


struct LinkedList {
    var root: Node?
    
    func removeConsecutiveNodesWithZeroSum() -> String {
        
        var result = ""
        var start = root
        var end = start
        
        while start != nil {
            
            var hasChanged = false
            var cumul = 0
            end = start
            
            while end != nil {
                cumul += end!.value
                
                if cumul == 0 {
                    start = end
                    hasChanged = true
                    break
                }
                
                end = end?.next
            }
            
            if !hasChanged && start != nil {
                result = result.isEmpty ? "\(result)\(start!.value)" : "\(result)->\(start!.value)"
            }
            
            start = start?.next
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_305Tests: XCTestCase {

    func test_example() {
        let ll = LinkedList(root: Node(value: 3, next: Node(value: 4, next: Node(value: -7, next: Node(value: 5, next: Node(value: -6, next: Node(value: 6, next: nil)))))))
        
        XCTAssert(ll.removeConsecutiveNodesWithZeroSum() == "5")
    }

}
```