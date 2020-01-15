## Description

This problem was asked by Microsoft.

Recall that the minimum spanning tree is the subset of edges of a tree that connect all its vertices with the smallest possible total edge weight. Given an undirected graph with weighted edges, compute the maximum weight spanning tree.

## Solution

```swift
typealias Edge = (nodes: [Node], weight: Int)

class Node {
    var value: Int
    var siblings: [(node: Node, weight: Int)]
    
    init(value: Int) {
        self.value = value
        self.siblings = []
    }
    
    func allEdges(current: [Edge]) -> [Edge] {
        
        var result: [Edge] = []
        
        for sibling in siblings {
            if !current.contains(where: { (edge) -> Bool in
                return (edge.nodes[0].value == self.value && edge.nodes[1].value == sibling.node.value) || (edge.nodes[1].value == self.value && edge.nodes[0].value == sibling.node.value)
            }) {
                result.append(([self,sibling.node], sibling.weight))
            }
        }
        
        if result.isEmpty {
            return []
        }
        
        result.append(contentsOf: current)
        
        for sibling in siblings {
            result.append(contentsOf: sibling.node.allEdges(current: result))
        }
        
        return result
    }
    
    func maximumSpanningTree() -> [Edge] {
        
        let edges = allEdges(current: []).sorted{ $0.weight > $1.weight }
        
        var result: [Edge] = []
        
        for edge in edges {
            if !result.contains(where: { (a_edge) -> Bool in
                return (a_edge.nodes[0].value == edge.nodes[0].value && a_edge.nodes[1].value == edge.nodes[1].value) || (a_edge.nodes[0].value == edge.nodes[1].value && a_edge.nodes[1].value == edge.nodes[0].value)
            }) {
                if !canLoop(from: edge.nodes[0], to: edge.nodes[1], with: result) {
                    result.append(edge)
                }
            }
        }
        
        return result
    }
    
    func canLoop(from: Node, to: Node, with edges: [Edge]) -> Bool {
        
        if edges.isEmpty {
            return false
        }
        
        for i in 0..<edges.count {
            
            if edges[i].nodes.contains(where: { (node) -> Bool in
                return node.value == from.value
            }) {
                if edges[i].nodes[0].value == to.value || edges[i].nodes[1].value == to.value {
                    return true
                }
                
                var copy = edges
                copy.remove(at: i)
                
                var nodes = edges[i].nodes
                nodes.removeAll { (node) -> Bool in
                    return node.value == from.value
                }
                
                if canLoop(from: nodes.first!, to: to, with: copy) {
                    return true
                }
            }
        }
        
        return false
    }
}
```

## Tests

```swift
class Problem_234Tests: XCTestCase {

    func test_all_edges() {
        let n1 = Node(value: 0)
        let n2 = Node(value: 1)
        let n3 = Node(value: 2)
        let n4 = Node(value: 3)
        let n5 = Node(value: 4)
        
        n1.siblings = [(n2, 1), (n3, 2)]
        n3.siblings = [(n4, 4), (n5, 5)]
        
        let actual = n1.allEdges(current: [])
        
        XCTAssert(actual.contains(where: { (_, weight) -> Bool in
            return weight == 1
        }))
        
        XCTAssert(actual.contains(where: { (_, weight) -> Bool in
            return weight == 2
        }))
        
        XCTAssert(actual.contains(where: { (_, weight) -> Bool in
            return weight == 4
        }))
        
        XCTAssert(actual.contains(where: { (_, weight) -> Bool in
            return weight == 5
        }))
    }
    
    func test_maximum_spanning_tree() {
        let n1 = Node(value: 1)
        let n2 = Node(value: 2)
        let n3 = Node(value: 3)
        let n4 = Node(value: 4)
        let n5 = Node(value: 5)
        
        n1.siblings = [(n2, 1), (n3, 2)]
        n3.siblings = [(n4, 4), (n5, 5), (n2, 8)]
        
        let actual = n1.maximumSpanningTree()
        let expected = [8, 5, 4, 2] // It's ordered by descending weight
        
        XCTAssert(actual.map{ $0.weight } == expected)
    }

}
```