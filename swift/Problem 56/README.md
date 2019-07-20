## Description

This problem was asked by Google.

Given an undirected graph represented as an adjacency matrix and an integer k, write a function to determine whether each vertex in the graph can be colored such that no two adjacent vertices share the same color using at most k colors.

## Solution

I had no idead whatadjacency matrix adjacency matrix meant, so I look it up: https://en.wikipedia.org/wiki/Adjacency_matrix#Undirected_graphs
 
The first graph in the abode link shows that the the node 4 has 3 relations (by looking at the column 4 or row 4, the node 6 has 1 relation, etc...

It seems that max(sum(row)) gives us how many unique color (relation) are required minimum for not having adjacent vertexes with the same color
    
```swift
extension Array where Element == Array<Int> {
    
    func isValid(k: Int) -> Bool {
        for row in self {
            if row.reduce(0, +) > k {
                print(row.reduce(0, +))
                return false
            }
        }
        
        return true
    }
}
```

## Test

```swift
class Problem_56Tests: XCTestCase {

    func test_1() {
        let input = [
            [2,1,0,0,1,0],
            [1,0,1,0,1,0],
            [0,1,0,1,0,0],
            [0,0,1,0,1,1],
            [1,1,0,1,0,0],
            [0,0,0,1,0,0]
        ]
        
        XCTAssertFalse(input.isValid(k: 1))
        XCTAssertFalse(input.isValid(k: 2))
        XCTAssertFalse(input.isValid(k: 3))
        XCTAssertTrue(input.isValid(k: 4))
        XCTAssertTrue(input.isValid(k: 5))
        XCTAssertTrue(input.isValid(k: 6))
    }

}

```