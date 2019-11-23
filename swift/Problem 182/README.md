## Description

This problem was asked by Google.

Given a string, split it into as few strings as possible such that each string is a palindrome.

For example, given the input string racecarannakayak, return ["racecar", "anna", "kayak"].

Given the input string abc, return ["a", "b", "c"].

## Solution

```swift
class Node {
    var value: Int
    var children: [Node]
    
    init(value: Int, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    init(value: Int) {
        self.value = value
        self.children = []
    }
    
    func isMinimallyConnected() -> Bool {
        return !scanChildren(current: [self])
    }
    
    private func scanChildren(current: [Node]) -> Bool {
        var copy = current
        
        for child in children {
            if current.contains(where: { (element) -> Bool in
                element.value == child.value
            }) {
                return false
            }
            
            copy.append(child)
        }
        
        for child in children {
            if !child.scanChildren(current: copy) {
                return false
            }
        }
        
        return true
    }
}
```

## Test

```swift
class Problem_182Tests: XCTestCase {

    func test_minimally_connected_true() {
        
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        
        node1.children = [node2]
        node2.children = [node3]
        node3.children = [node1]
        
        XCTAssertTrue(node1.isMinimallyConnected())
    }
    
    func test_minimally_connected_false() {
        
        let root = Node(value: 1)
        
        let l = Node(value: 2)
        let r = Node(value: 3)
        root.children = [l, r]
        
        let ll = Node(value: 4)
        let lr = Node(value: 5)
        l.children = [ll, lr]
        
        let rr = Node(value: 6)
        r.children = [rr]
        
        XCTAssertFalse(root.isMinimallyConnected())
    }

}
```