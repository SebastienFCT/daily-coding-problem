## Description

This problem was asked by LinkedIn.

Given a list of points, a central point, and an integer `k`, find the nearest `k` points from the central point.

For example, given the list of points `[(0, 0), (5, 4), (3, 1)]`, the central point `(1, 2)`, and `k` = 2, return `[(0, 0), (3, 1)]`.

## Solution

```swift
typealias XYPoint = (x: Int, y: Int)

extension Array where Element == XYPoint {
    
    typealias XYPointDistance = (point: XYPoint, distance: Int)
    
    func findNearestPoints(from: XYPoint, limit: Int) -> [XYPoint] {
        
        if limit >= self.count {
            return self
        }
        
        let distances: [XYPointDistance] = self.map{ point in
            let xDistance = abs(from.x - point.x)
            let yDistance = abs(from.y - point.y)
            
            return (point, xDistance + yDistance)
        }
        
        let sorted = distances.sorted{ $0.distance < $1.distance }.prefix(limit).map{ $0.point }
        
        return sorted
    }
}
```

## Test

```swift
class Problem_150Tests: XCTestCase {

    func test_example() {
        let input: [XYPoint] = [(0, 0), (5, 4), (3, 1)]
        
        XCTAssert(input.findNearestPoints(from: (1, 2), limit: 2).count == 2)
        XCTAssert(input.findNearestPoints(from: (1, 2), limit: 2).contains(where: { (point) -> Bool in
            return (point.x == 0 && point.y == 0) || (point.x == 3 && point.y == 1)
        }))
    }

}
```