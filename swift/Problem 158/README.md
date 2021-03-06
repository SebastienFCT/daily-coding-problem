## Description

This problem was asked by Slack.

You are given an N by M matrix of `0`s and `1`s. Starting from the top left corner, how many ways are there to reach the bottom right corner?

You can only move right and down. `0` represents an empty space while 1 represents a wall you cannot walk through.

For example, given the following matrix:

```
[[0, 0, 1],
 [0, 0, 1],
 [1, 0, 0]]
 ```

Return two, as there are only two ways to get to the bottom right:

- Right, down, down, right
- Down, right, down, right

The top left corner and bottom right corner will always be `0`.

## Solution

```swift
extension Array where Element == Array<Int> {
    
    typealias Position = (row: Int, column: Int)
    
    func pathCountFromTopLeftToBottomRight() -> Int {
        return pathCounter(from: (0,0), to: (count-1, self[count-1].count-1))
    }
    
    func pathCounter(from: Position, to: Position) -> Int {
        var result = 0
        
        if from.row == to.row && from.column == to.column {
            return 1
        }
        
        var newArray = self
        newArray[from.row][from.column] = 1
        
        let allCandidates = candidates(from: from)
        
        for candidate in allCandidates {
            result += newArray.pathCounter(from: candidate, to: to)
        }
        
        return result
    }
    
    func candidates(from: Position) -> [Position] {
        var positions: [Position] = []
        
        if let top = takeIfExist(position: (from.row-1, from.column)), top == 0 {
            positions.append((from.row-1, from.column))
        }

        if let bottom = takeIfExist(position: (from.row+1, from.column)), bottom == 0 {
            positions.append((from.row+1, from.column))
        }
        
        if let left = takeIfExist(position: (from.row, from.column-1)), left == 0 {
            positions.append((from.row, from.column-1))
        }
        
        if let right = takeIfExist(position: (from.row, from.column+1)), right == 0 {
            positions.append((from.row, from.column+1))
        }
        
        return positions
    }
    
    func takeIfExist(position: Position) -> Int? {
        if position.row < 0 || position.column < 0 || position.row >= count || position.column >= self[position.row].count {
            return nil
        }
        
        return self[position.row][position.column]
    }
}
```

## Test

```swift
class Problem_158Tests: XCTestCase {

    func test_example() {
        let input = [
            [0, 0, 1],
            [0, 0, 1],
            [1, 0, 0]
        ]
        
        XCTAssert(input.pathCountFromTopLeftToBottomRight() == 2)
    }

}
```