## Description

This problem was asked by Nvidia.

You are given a list of N points (x1, y1), (x2, y2), ..., (xN, yN) representing a polygon. You can assume these points are given in order; that is, you can construct the polygon by connecting point 1 to point 2, point 2 to point 3, and so on, finally looping around to connect point N to point 1.

Determine if a new point p lies inside this polygon. (If p is on the boundary of the polygon, you should return False).

## Solution

```swift
typealias NPoint = (x: Int, y: Int)

typealias NPolygon = [NPoint]    // Assuming it's ordered

func isPointInPolygon(point: NPoint, polygon: NPolygon) -> Bool {
    
    // Based on https://en.wikipedia.org/wiki/Point_in_polygon:
    
    // Create a line equation out of the point: Zx + y for example
    // To make it simpler, let's use the horizontal line passing by y2 -> y = y2
    
    // For each segment, check if line goes through, if we touch a boudary, we stop and return false
    
    var intersections = 0
    
    var index = 0
    while index < polygon.count-1 {
        let p1 = polygon[index]
        let p2 = polygon[index+1]
        
        // If touches boundary, return false
        if crossProduct(p1: p1, p2: p2, comparisonPoint: point) == 0 {
            return false
        }
        
        let betweenYs = (p1.y >= point.y && p2.y <= point.y || p1.y <= point.y && p2.y >= point.y)
        let passedX = p1.x >= point.x || p2.x >= point.x
        
        if betweenYs && passedX {
            intersections += 1
        }
        
        index += 2
    }
    
    if polygon.count % 2 == 0 {
        let p1 = polygon[polygon.count-1]
        let p2 = polygon[0]
        
        if crossProduct(p1: p1, p2: p2, comparisonPoint: point) == 0 {
            return false
        }
        
        if p1.y >= point.y && p2.y <= point.y || p1.y <= point.y && p2.y >= point.y {
            intersections += 1
        }
    }
    
    return intersections % 2 == 1
}

func crossProduct(p1: NPoint, p2: NPoint, comparisonPoint: NPoint) -> Int {
    
    return (p2.y - p1.y) * (comparisonPoint.x - p1.x) - (p2.x - p1.x) * (comparisonPoint.y - p1.y)
}
```

## Tests

```swift
class Problem_236Tests: XCTestCase {

    func test_point_in_polygon() {
        
        let polygon: NPolygon = [(1, 1), (1, 2), (3, 6), (4, 2), (5, 3)]
        let point: NPoint = (2, 2)
        
        XCTAssertTrue(isPointInPolygon(point: point, polygon: polygon))
    }
    
    func test_point_out_of_polygon() {
        
        let polygon: NPolygon = [(1, 1), (1, 2), (3, 6), (4, 2), (5, 3)]
        let point: NPoint = (6, 6)
        
        XCTAssertFalse(isPointInPolygon(point: point, polygon: polygon))
    }
    
    func test_point_on_polygon_bound() {
        
        let polygon: NPolygon = [(1, 1), (1, 2), (3, 6), (4, 2), (5, 3)]
        let point: NPoint = (1, 1)
        
        XCTAssertFalse(isPointInPolygon(point: point, polygon: polygon))
    }

}
```