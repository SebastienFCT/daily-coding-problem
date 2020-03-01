## Description

This problem was asked by LinkedIn.

A wall consists of several rows of bricks of various integer lengths and uniform height. Your goal is to find a vertical line going from the top to the bottom of the wall that cuts through the fewest number of bricks. If the line goes through the edge between two bricks, this does not count as a cut.

For example, suppose the input is as follows, where values in each row represent the lengths of bricks in that row:

```
[[3, 5, 1, 1],
 [2, 3, 3, 2],
 [5, 5],
 [4, 4, 2],
 [1, 3, 3, 3],
 [1, 1, 6, 1, 1]]
```

The best we can we do here is to draw a line after the eighth brick, which will only require cutting through the bricks in the third and fifth row.

Given an input consisting of brick lengths for each row such as the one above, return the fewest number of bricks that must be cut to create a vertical line.

## Solution

```swift
struct Wall {
    
    var stack: [[Int]]
    
    func optimalCut() -> Int {
        
        guard stack.count > 0 else {
            return 0
        }

        let maxLength = stack.map{ $0.reduce(0, { $0 + $1 }) }.sorted{ $0 > $1 }.first!
        var cuts: [Int: Int] = [:]
        
        for i in 1..<maxLength {
            
            var cutCount = 0
            
            for row in stack {
                if row.isCutting(position: i) {
                    cutCount += 1
                }
            }
            
            cuts[i] = cutCount
        }
        
        let sorted = cuts.sorted{ $0.1 < $1.1 }
        
        return sorted.first!.key
    }
}

typealias BrickRow = [Int]

extension BrickRow {
    
    func isCutting(position: Int) -> Bool {
        
        var current = 0
        
        for brick in self {
            
            current += brick
            
            if position < current {
                return true
            }
            
            if position == current {
                return false
            }
        }
        
        return false
    }
}
```

## Tests

```swift
class Problem_281Tests: XCTestCase {

    func test_example() {
        
        let wall = Wall(stack: [
            [3, 5, 1, 1],
            [2, 3, 3, 2],
            [5, 5],
            [4, 4, 2],
            [1, 3, 3, 3],
            [1, 1, 6, 1, 1]
        ])
        
        let expected = 8
        let actual = wall.optimalCut()
        
        XCTAssert(actual == expected)
    }

}
```