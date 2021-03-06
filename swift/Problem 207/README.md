## Description

This problem was asked by Dropbox.

Given an undirected graph G, check whether it is bipartite. Recall that a graph is bipartite if its vertices can be divided into two independent sets, U and V, such that no edge connects vertices of the same set.

## Solution

```swift
class Node: Equatable {
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.guid == rhs.guid
    }
    
    var value: String
    var connections: [Node]
    var guid: UUID
    
    init(value: String, connections: [Node]) {
        self.value = value
        self.connections = connections
        self.guid = UUID()
    }
    
    init(value: String) {
        self.value = value
        self.connections = []
        self.guid = UUID()
    }
    
    func isBipartite() -> Bool {
        
        var uList: [Node] = []
        var vList: [Node] = []
        var uListNext = true
        
        var next: [Node] = []
        next.append(self)
        
        while !next.isEmpty {
            var nextNext: [Node] = []
            
            for node in next {
                if uListNext {
                    if vList.contains(node) {
                        return false
                    }
                    
                    if !uList.contains(node) {
                        uList.append(node)
                        nextNext.append(contentsOf: node.connections)
                    }
                } else {
                    if uList.contains(node) {
                        return false
                    }
                    
                    if !vList.contains(node) {
                        vList.append(node)
                        nextNext.append(contentsOf: node.connections)
                    }
                }
            }
            
            next = nextNext
            uListNext.toggle()
        }
        
        return true
    }
}
```

## Test

```swift
class Problem_207Tests: XCTestCase {
    
    func test_bipartite_graph() {
        let a = Node(value: "a")
        let b = Node(value: "b")
        let c = Node(value: "c")
        let d = Node(value: "d")
        
        
        a.connections = [b]
        b.connections = [c]
        c.connections = [d]
        d.connections = [a]
        
        XCTAssertTrue(a.isBipartite())
    }

    func test_non_bipartitte_graph() {
        let a = Node(value: "a")
        let b = Node(value: "b")
        let c = Node(value: "c")
        let d = Node(value: "d")
        
        
        a.connections = [b]
        b.connections = [c,d]
        c.connections = [d]
        d.connections = [a]
        
        XCTAssertFalse(a.isBipartite())
    }

}
```