## Description

This problem was asked by Airbnb.

An 8-puzzle is a game played on a 3 x 3 board of tiles, with the ninth tile missing. The remaining tiles are labeled 1 through 8 but shuffled randomly. Tiles may slide horizontally or vertically into an empty space, but may not be removed from the board.

Design a class to represent the board, and find a series of steps to bring the board to the state `[[1, 2, 3], [4, 5, 6], [7, 8, None]]`.

## Solution

```swift
typealias Grid = [[Int?]]
typealias Position = (row: Int, column: Int)

struct EightPuzzle {
    
    var grid: Grid
    
    func solutions() -> [[Grid]] {
        
        for i in 0..<grid.count {
            for j in 0..<grid.count {
                if grid[i][j] == nil {
                    return grid.solve(previousStates: [], currentPos: (i, j))
                }
            }
        }
        
        return []
    }
}

extension Grid {
    
    func solve(previousStates: [Grid], currentPos: Position) -> [[Grid]] {
        var newStates = previousStates
        newStates.append(self)
        
        if self == [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, nil]
            ] {
            return [newStates]
        }
        
        if previousStates.contains(self) {
            return []
        }
        
        var result: [[Grid]] = []
        
        var nextPositions: [Position] = []
        
        if currentPos.row > 0 {
            nextPositions.append((currentPos.row-1, currentPos.column))
        }
        
        if currentPos.column > 0 {
            nextPositions.append((currentPos.row, currentPos.column-1))
        }
        
        if currentPos.row < count-1 {
            nextPositions.append((currentPos.row+1, currentPos.column))
        }
        
        if currentPos.column < count-1 {
            nextPositions.append((currentPos.row, currentPos.column+1))
        }
        
        for pos in nextPositions {
            
            var copy = self
            copy[currentPos.row][currentPos.column] = copy[pos.row][pos.column]
            copy[pos.row][pos.column] = nil
            
            let candidates = copy.solve(previousStates: newStates, currentPos: (pos.row, pos.column))
            
            if !candidates.isEmpty {
                result.append(contentsOf: copy.solve(previousStates: newStates, currentPos: (pos.row, pos.column)))
            }
        }
        
        return result
        
    }
}
```

## Tests

```swift
class Problem_319Tests: XCTestCase {

    func test_eight_puzzle_solver() {
        
        
        let input = EightPuzzle(grid: [
            [1, 2, 3],
            [4, 5, 6],
            [7, nil, 8]
        ])
        
        print(input.solutions().first)
    }

}
```