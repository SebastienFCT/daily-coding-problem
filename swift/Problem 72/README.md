## Description

This problem was asked by Google.

In a directed graph, each node is assigned an uppercase letter. We define a path's value as the number of most frequently-occurring letter along that path. For example, if a path in the graph goes through "ABACA", the value of the path is 3, since there are 3 occurrences of 'A' on the path.

Given a graph with `n` nodes and `m` directed edges, return the largest value path of the graph. If the largest value is infinite, then return null.

The graph is represented with a string and an edge list. The `i`-th character represents the uppercase letter of the `i`-th node. Each tuple in the edge list `(i, j)` means there is a directed edge from the `i`-th node to the `j`-th node. Self-edges are possible, as well as multi-edges.

For example, the following input graph:

```
ABACA
```

```
[(0, 1),
 (0, 2),
 (2, 3),
 (3, 4)]
```

Would have maximum value 3 using the path of vertices `[0, 2, 3, 4]`, `(A, A, C, A)`.

The following input graph:

```
A
```

```
[(0, 0)]
```

Should return null, since we have an infinite loop.

## Solution

```swift
struct DirectedGraph {
    var nodes: String
    var edges: [(Int, Int)]
    
    func findPathValue() -> (key: Character, value: Int)? {
        var candidates: [(index: Int, value: String)] = []
        
        for i in 0..<edges.count {
            let value = nodes[nodes.index(nodes.startIndex, offsetBy: i)]
            
            if let possiblePaths = paths(current: (i, String(value)), previouslyVisited: [i]) {
                candidates.append(contentsOf: possiblePaths)
            } else {
                // We found a loop
                return nil
            }
        }
        
        // Get paths value for each potential sub-tree
        let mapped = candidates.map{ $0.value }
        
        var pathValues: [[Character: Int]] = []
        
        for item in mapped {
            var aPath: [Character: Int] = [:]
            
            for character in item {
                if aPath.keys.contains(character) {
                    aPath[character]! += 1
                } else {
                    aPath[character] = 1
                }
            }
            
            pathValues.append(aPath)
        }
        
        // Only keep greatest path values for each character
        var bestPV: [Character: Int] = [:]
        
        for character in nodes {
            if !bestPV.keys.contains(character) {
                bestPV[character] = 0
            }
            
            for pathValue in pathValues {
                if pathValue.keys.contains(character) {
                    if pathValue[character]! > bestPV[character]! {
                        bestPV[character] = pathValue[character]!
                    }
                }
            }
        }
        
        // Sort and return greatest value
        let sortedPathValues = bestPV.sorted{ $0.value > $1.value }
        
        return sortedPathValues.first!
    }
    
    private func paths(current: (index: Int, value: String), previouslyVisited: [Int]) -> [(index: Int, value: String)]? {
        var candidates: [(index: Int, value: String)] = []
        var visited = previouslyVisited
        
        for edge in edges {
            if edge.0 == current.index {
                // If an index had already been visited, then we have a loop
                if previouslyVisited.contains(where: { (value) -> Bool in
                    value == edge.1
                }) {
                    return nil
                }
                
                var copy = current
                copy.index = edge.1
                copy.value += String(nodes[nodes.index(nodes.startIndex, offsetBy: edge.1)])
                visited.append(edge.1)
                
                
                candidates.append(copy)
            }
        }
        
        if candidates.isEmpty {
            return [current]
        }
        
        var result: [(index: Int, value: String)] = []
        
        for candidate in candidates {
            guard let paths = paths(current: candidate, previouslyVisited: visited) else {
                // This leads to a loop
                return nil
            }
            
            result.append(contentsOf: paths)
        }
    
        return result
    }
}
```

## Test

```swift
class Problem_72Tests: XCTestCase {

    func test_example_1() {
        let graph = DirectedGraph(nodes: "ABACA", edges: [(0, 1),(0, 2),(2, 3),(3, 4)])
        
        print(graph.findPathValue()!.value == 3)
    }
    
    func test_example_2() {
        let graph = DirectedGraph(nodes: "A", edges: [(0, 0)])
        
        print(graph.findPathValue() == nil)
    }

}
```