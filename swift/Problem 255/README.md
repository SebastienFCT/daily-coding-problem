## Description

This problem was asked by Microsoft.

The transitive closure of a graph is a measure of which vertices are reachable from other vertices. It can be represented as a matrix M, where `M[i][j] == 1` if there is a path between vertices `i` and `j`, and otherwise `0`.

For example, suppose we are given the following graph in adjacency list form:

```
graph = [
    [0, 1, 3],
    [1, 2],
    [2],
    [3]
]
```

The transitive closure of this graph would be:

```
[1, 1, 1, 1]
[0, 1, 1, 0]
[0, 0, 1, 0]
[0, 0, 0, 1]
```

Given a graph, find its transitive closure.

## Solution

```swift
extension Array where Element == Array<Int> {
    
    func transitiveClosure() -> [[Int]] {
        
        var result: [[Int]] = []
        
        let defaultRow = Swift.Array(repeating: 0, count: count)
        for _ in 0..<count {
            result.append(defaultRow)
        }
        
        for i in 0..<count {
            
            for reference in self[i] {
                
                result[i][reference] = 1
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_255Tests: XCTestCase {

    func test_example() {
        
        let input = [
            [0, 1, 3],
            [1, 2],
            [2],
            [3]
        ]
        
        let expected = [
            [1, 1, 0, 1],
            [0, 1, 1, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1]
        ]
        
        let actual = input.transitiveClosure()
        
        XCTAssert(actual == expected)
    }

}
```