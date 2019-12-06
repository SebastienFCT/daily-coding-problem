## Description

This problem was asked by Facebook.

Suppose you are given two lists of n points, one list p1, p2, ..., pn on the line y = 0 and the other list q1, q2, ..., qn on the line y = 1. Imagine a set of `n` line segments connecting each point pi to qi. Write an algorithm to determine how many pairs of the line segments intersect.

## Solution

```swift
typealias Point = (x: Int, y: Int)
typealias Line = (start: Point, end: Point)

func intersectionsForLines(withStartingPoints: [Int], andEndingPoints: [Int]) -> Int {
    
    var lines: [Line] = []
    var result = 0
    
    for i in 0..<withStartingPoints.count {
        
        // All points are on the same y axis
        let newLine: Line = ((withStartingPoints[i], 0), (andEndingPoints[i], 1))
        
        for line in lines {
            let c1 = line.start.x > newLine.start.x && line.end.x < newLine.end.x
            let c2 = line.start.x < newLine.start.x && line.end.x > newLine.end.x
            
            if c1 || c2 {
                result += 1
            }
        }
        
        lines.append(newLine)
    }
    
    return result
}
```

## Test

```swift
class Problem_194Tests: XCTestCase {

    func test_intersection_algorithm() {
        XCTAssert(intersectionsForLines(withStartingPoints: [0, 1, 2, 3], andEndingPoints: [0, 1, 2, 3]) == 0)
        
        XCTAssert(intersectionsForLines(withStartingPoints: [0, 1, 2, 3], andEndingPoints: [0, 1, 3, 2]) == 1)
        
        XCTAssert(intersectionsForLines(withStartingPoints: [0, 1, 2, 3], andEndingPoints: [3, 2, 1, 0]) == 6)
    }

}
```