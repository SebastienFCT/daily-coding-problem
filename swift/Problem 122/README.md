## Description

This question was asked by Zillow.

You are given a 2-d `matrix` where each cell represents number of coins in that cell. Assuming we start at `matrix[0][0]`, and can only move right or down, find the maximum number of coins you can collect by the bottom right corner.

For example, in this matrix

```
0 3 1 1
2 0 0 4
1 5 3 1
```

The most we can collect is 0 + 2 + 1 + 5 + 3 + 1 = 12 coins.

## Solution

```swift
extension Array where Element == Array<Int> {
    
    typealias Position = (row: Int, column: Int)
    
    func findMaximumPath() -> PathResult? {
        
        let initialPosition: PathResult = ([(row: 0, column: 0)], self[0][0])
        let candidates = next(path: initialPosition)
        
        return candidates.sorted{ $0.sum > $1.sum }.first
    }
    
    typealias PathResult = (positions: [Position], sum: Int)
    
    func next(path: PathResult) -> [PathResult] {
        var candidates: [PathResult] = []
        
        
        if let current = path.positions.last {
            
            if current.row == self.count-1 && current.column == self[0].count-1 {
                return [path]
            }
            
            if current.row < self.count-1 {
                let newPos = (row: current.row+1, column: current.column)
                
                var candidate = path
                candidate.positions.append(newPos)
                candidate.sum += self[newPos.row][newPos.column]
                
                candidates.append(contentsOf: next(path: candidate))
            }
            
            if current.column < self[0].count-1 {
                let newPos = (row: current.row, column: current.column+1)
                
                var candidate = path
                candidate.positions.append(newPos)
                candidate.sum += self[newPos.row][newPos.column]
                
                candidates.append(contentsOf: next(path: candidate))
            }
        }
        
        return candidates
    }
}
```

## Test

```swift
class Problem_122Tests: XCTestCase {

    func test_example() {
        let input: [[Int]] = [
            [0, 3, 1, 1],
            [2, 0, 0, 4],
            [1, 5, 3, 1]
        ]
        
        XCTAssert(input.findMaximumPath()?.sum == 12)
    }

}
```