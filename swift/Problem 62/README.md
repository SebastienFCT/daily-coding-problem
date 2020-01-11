## Description

This problem was asked by Facebook.

There is an N by M matrix of zeroes. Given N and M, write a function to count the number of ways of starting at the top-left corner and getting to the bottom-right corner. You can only move right or down.

For example, given a 2 by 2 matrix, you should return 2, since there are two ways to get to the bottom-right:

- Right, then down
- Down, then right

Given a 5 by 5 matrix, there are 70 ways to get to the bottom-right.

## Solution

```swift
extension Array where Element == Array<Int> {
    
    func possibilities(current: (row: Int, column: Int)) -> [(row: Int, column: Int)] {
        var result: [(row: Int, column: Int)] = []
        
        if current.row+1 < self.count {
            if self[current.row+1][current.column] == 0 {
                result.append((row: current.row+1, column: current.column))
            }
        }
        
        if current.column+1 < self[current.row].count {
            if self[current.row][current.column+1] == 0 {
                result.append((row: current.row, column: current.column+1))
            }
        }
        
        return result
    }
    
    func move(row: Int, column: Int) -> [[Int]] {
        var copy = self
        
        copy[row][column] = 1
        
        return copy
    }

    func pathCount(current: (row: Int, column: Int), to: (row: Int, column: Int)) -> Int {
        var result = 0
        
        let allPossibilities = possibilities(current: current)
        
        if allPossibilities.isEmpty {
            return 0
        }
        
        for possibility in allPossibilities {
            if possibility == to {
                result += 1
            } else {
                let newArray = move(row: possibility.row, column: possibility.column)
                result += newArray.pathCount(current: possibility, to: to)
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_62Tests: XCTestCase {

    func test_1() {
        let input = [[0,0],[0,0]]
        
        print(input.possibilities(current: (0,0)))
    }
    
    func test_example() {
        let input = [[0,0],[0,0]]
        
        XCTAssert(input.pathCount(current: (0,0), to: (1,1)) == 2)
    }

    func test_example2() {
        let input = [
            [0,0,0,0,0],
            [0,0,0,0,0],
            [0,0,0,0,0],
            [0,0,0,0,0],
            [0,0,0,0,0]
        ]
        
        XCTAssert(input.pathCount(current: (0,0), to: (4,4)) == 70)
    }
}
```