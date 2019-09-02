## Description

This problem was asked by Google.

You are in an infinite 2D grid where you can move in any of the 8 directions:

```
 (x,y) to
    (x+1, y),
    (x - 1, y),
    (x, y+1),
    (x, y-1),
    (x-1, y-1),
    (x+1,y+1),
    (x-1,y+1),
    (x+1,y-1)
```

You are given a sequence of points and the order in which you need to cover the points. Give the minimum number of steps in which you can achieve it. You start from the first point.

Example:

```
Input: [(0, 0), (1, 1), (1, 2)]
Output: 2
```

It takes 1 step to move from `(0, 0)` to `(1, 1)`. It takes one more step to move from `(1, 1)` to `(1, 2)`.

## Solution

```swift
typealias Point = (row: Int, column: Int)

func distanceBetween(a: Point, b: Point) -> Int {
    let width = abs(b.column - a.column)
    let height = abs(b.row - a.row)
    
    return max(width, height)
}

extension Array where Element == Point {
    func minimumSteps() -> Int {
        var result = 0
        var copy = self
        var current = copy.removeFirst()
        
        while !copy.isEmpty {
            let next = copy.removeFirst()
            
            result += distanceBetween(a: current, b: next)
            current = next
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_100Tests: XCTestCase {

    func test_example() {
        let input: [Point] = [(0, 0), (1, 1), (1, 2)]
        XCTAssert(input.minimumSteps() == 2)
    }

}
```