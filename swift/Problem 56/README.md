## Description

This problem was asked by Google.

Given an undirected graph represented as an adjacency matrix and an integer k, write a function to determine whether each vertex in the graph can be colored such that no two adjacent vertices share the same color using at most k colors.

## Solution
    
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