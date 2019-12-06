## Description

This problem was asked by Google.

Let A be an N by M matrix in which every row and every column is sorted.

Given i1, j1, i2, and j2, compute the number of elements of M smaller than M[i1, j1] and larger than M[i2, j2].

For example, given the following matrix:

```
[[1, 3, 7, 10, 15, 20],
 [2, 6, 9, 14, 22, 25],
 [3, 8, 10, 15, 25, 30],
 [10, 11, 12, 23, 30, 35],
 [20, 25, 30, 35, 40, 45]]
```

And i1 = 1, j1 = 1, i2 = 3, j2 = 3, return 15 as there are 15 numbers in the matrix smaller than 6 or greater than 23.

## Solution

```swift
typealias Position = (row: Int, column: Int)

extension Array where Element == Array<Int> {
    
    func countWhereElement(smallerThanElementAt maxPos: Position, andGreaterThanElementAt minPos: Position) -> Int {
        
        guard maxPos.row >= 0, minPos.row >= 0, maxPos.column >= 0, minPos.row >= 0, let rowSize = self.first?.count, maxPos.row < count, maxPos.column < rowSize, minPos.row < count, minPos.column < rowSize else {
            return 0
        }
        
        var result = 0
        
        let maxValue = self[maxPos.row][maxPos.column]
        let minValue = self[minPos.row][minPos.column]
        
        for i in 0..<count {
            for j in 0..<rowSize {
                if self[i][j] < maxValue && self[i][j] > minValue {
                    result += 1
                }
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_195Tests: XCTestCase {

    func test_example() {
        let input = [
            [1, 3, 7, 10, 15, 20],
            [2, 6, 9, 14, 22, 25],
            [3, 8, 10, 15, 25, 30],
            [10, 11, 12, 23, 30, 35],
            [20, 25, 30, 35, 40, 45]
        ]
        
        let computed = input.countWhereElement(smallerThanElementAt: (1, 1), andGreaterThanElementAt: (3, 3))
        
        let expected = 0
        
        // There are no value smaller than 6 and greater than 23
        XCTAssert(computed == expected)
    }
    
    func test_example_1() {
        let input = [
            [1, 3, 7, 10, 15, 20],
            [2, 6, 9, 14, 22, 25],
            [3, 8, 10, 15, 25, 30],
            [10, 11, 12, 23, 30, 35],
            [20, 25, 30, 35, 40, 45]
        ]
        
        let computed = input.countWhereElement(smallerThanElementAt: (3, 3), andGreaterThanElementAt: (1, 1))
        
        // greater than 6 and lesser than 23 are
        // 7, 10, 15, 20, 9, 14, 22, 8, 10, 15, 10, 11, 12, 20
        let expected = 14
        
        XCTAssert(computed == expected)
    }

}
```