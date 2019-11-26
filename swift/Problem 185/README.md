## Description

This problem was asked by Google.

Given two rectangles on a 2D graph, return the area of their intersection. If the rectangles don't intersect, return 0.

For example, given the following rectangles:

```
{
    "top_left": (1, 4),
    "dimensions": (3, 3) # width, height
}
```

and

```
{
    "top_left": (0, 5),
    "dimensions": (4, 3) # width, height
}
```

return 6.

## Solution

```swift
struct Rectangle {
    var topLeftAnchor: (row: Int, column: Int)
    var dimensions: (width: Int, height: Int)
}

func intersection(left: Rectangle, right: Rectangle) -> Int {
    
    let minRow = max(left.topLeftAnchor.row, right.topLeftAnchor.row)
    let maxRow = min(left.topLeftAnchor.row + left.dimensions.width, right.topLeftAnchor.row + right.dimensions.width)
    
    let minColumn = max(left.topLeftAnchor.column, right.topLeftAnchor.column)
    let maxColumn = min(left.topLeftAnchor.column + left.dimensions.height, right.topLeftAnchor.column + right.dimensions.height)
    
    return (maxRow-minRow) * (maxColumn-minColumn)
}
```

## Test

```swift
class Problem_185Tests: XCTestCase {

    func test_example() {
        let left = Rectangle(topLeftAnchor: (1, 4), dimensions: (3, 3))
        let right = Rectangle(topLeftAnchor: (0, 5), dimensions: (4, 3))
        
        XCTAssert(intersection(left: left, right: right) == 6)
    }

}
```