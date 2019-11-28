## Description

This problem was asked by Google.

You are given given a list of rectangles represented by min and max x- and y-coordinates. Compute whether or not a pair of rectangles overlap each other. If one rectangle completely covers another, it is considered overlapping.

For example, given the following rectangles:

```
{
    "top_left": (1, 4),
    "dimensions": (3, 3) # width, height
},
{
    "top_left": (-1, 3),
    "dimensions": (2, 1)
},
{
    "top_left": (0, 5),
    "dimensions": (4, 3)
}
```

return true as the first and third rectangle overlap each other.

## Solution

```swift
struct Rectangle {
    var top_left: (row: Int, column: Int)
    var dimensions: (width: Int, height: Int)
    
    func intersectWith(rect: Rectangle) -> Bool {
        
        let minRow = max(self.top_left.row, rect.top_left.row)
        let maxRow = min(self.top_left.row + self.dimensions.width, rect.top_left.row + rect.dimensions.width)
        
        let minColumn = max(self.top_left.column, rect.top_left.column)
        let maxColumn = min(self.top_left.column + self.dimensions.height, rect.top_left.column + rect.dimensions.height)
        
        return (maxRow-minRow > 0) && (maxColumn-minColumn > 0)
    }

}

extension Array where Element == Rectangle {
    func intersect() -> Bool {
        
        for i in 0..<count-1 {
            for j in i+1..<count {                
                if self[i].intersectWith(rect: self[j]) {
                    return true
                }
            }
        }
        
        return false
    }
}
```

## Test

```swift
class Problem_187Tests: XCTestCase {

    func test_example() {
        let input: [Rectangle] = [Rectangle(top_left: (1,4), dimensions: (3,3)), Rectangle(top_left: (-1,3), dimensions: (2,1)), Rectangle(top_left: (0,5), dimensions: (4,3))]
        XCTAssertTrue(input.intersect())
    }

}
```