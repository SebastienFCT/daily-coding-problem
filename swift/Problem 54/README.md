## Description

This problem was asked by Dropbox.

Sudoku is a puzzle where you're given a partially-filled 9 by 9 grid with digits. The objective is to fill the grid with the constraint that every row, column, and box (3 by 3 subgrid) must contain all of the digits from 1 to 9.

Implement an efficient sudoku solver.

## Solution

Our sudoku template will be represented by a matrix of numbers.
 
We will represent the missing spots by nil

Let's start by building a rule that decides if a value can be inserted at a certain position

```swift
extension Array where Element == Array<Int?> {
    
    func isValid(value: Int, position: (row: Int, column: Int)) -> Bool {
        // First check if the row is valid
        if self[position.row].contains(value) {
            return false
        }
        
        // Then check the column
        let column = self.map{ $0[position.column] }
        if column.contains(value) {
            return false
        }
        
        // Finally, determine the sub-grid the value is in
        if grid(position: position).contains(value: value) {
            return false
        }
        
        return true
    }
    
    func contains(value: Int) -> Bool {
        for row in self {
            if row.contains(value) {
                return true
            }
        }
        
        return false
    }
    
    func grid(position: (row: Int, column: Int)) -> [[Int?]] {
        var result: [[Int?]] = []
        
        switch (position.row, position.column) {
        case (0...2, 0...2):
            for i in 0...2 {
                let newRow = Swift.Array(self[i][0...2])
                result.append(newRow)
            }
        case (0...2, 3...5):
            for i in 0...2 {
                let newRow = Swift.Array(self[i][3...5])
                result.append(newRow)
            }
        case (0...2, 6...8):
            for i in 0...2 {
                let newRow = Swift.Array(self[i][6...8])
                result.append(newRow)
            }
        case (3...5, 0...2):
            for i in 3...5 {
                let newRow = Swift.Array(self[i][0...2])
                result.append(newRow)
            }
        case (3...5, 3...5):
            for i in 3...5 {
                let newRow = Swift.Array(self[i][3...5])
                result.append(newRow)
            }
        case (3...5, 6...8):
            for i in 3...5 {
                let newRow = Swift.Array(self[i][6...8])
                result.append(newRow)
            }
        case (6...8, 0...2):
            for i in 6...8 {
                let newRow = Swift.Array(self[i][0...2])
                result.append(newRow)
            }
        case (6...8, 3...5):
            for i in 6...8 {
                let newRow = Swift.Array(self[i][3...5])
                result.append(newRow)
            }
        case (6...8, 6...8):
            for i in 6...8 {
                let newRow = Swift.Array(self[i][6...8])
                result.append(newRow)
            }
        default:
            break
        }
        
        return result
    }
    
    func getGridPositions(position: (row: Int, column: Int)) -> [(row: Int, column: Int)] {
        var result: [(row: Int, column: Int)] = []
        
        switch (position.row, position.column) {
        case (0...2, 0...2):
            for i in 0...2 {
                for j in 0...2 {
                    result.append((i, j))
                }
            }
        case (0...2, 3...5):
            for i in 0...2 {
                for j in 3...5 {
                    result.append((i, j))
                }
            }
        case (0...2, 6...8):
            for i in 0...2 {
                for j in 6...8 {
                    result.append((i, j))
                }
            }
        case (3...5, 0...2):
            for i in 3...5 {
                for j in 0...2 {
                    result.append((i, j))
                }
            }
        case (3...5, 3...5):
            for i in 3...5 {
                for j in 3...5 {
                    result.append((i, j))
                }
            }
        case (3...5, 6...8):
            for i in 3...5 {
                for j in 6...8 {
                    result.append((i, j))
                }
            }
        case (6...8, 0...2):
            for i in 6...8 {
                for j in 0...2 {
                    result.append((i, j))
                }
            }
        case (6...8, 3...5):
            for i in 6...8 {
                for j in 3...5 {
                    result.append((i, j))
                }
            }
        case (6...8, 6...8):
            for i in 6...8 {
                for j in 6...8 {
                    result.append((i, j))
                }
            }
        default:
            break
        }
        
        return result
    }
}
```

Ok, now that we have our basic rules, let's decide how our algorithm will run.
 
When you play a sudoku, you're looking for the best spot for your next candidate to fill. This is defined by the spot where there is the fewer chance to make a mistake. Let's write such a function

```swift
extension Array where Element == Array<Int?> {
    
    func possibilities(position: (row: Int, column: Int)) -> [Int] {
        var result: [Int] = []
        
        for value in 1...9 {
            if isValid(value: value, position: position) {
                result.append(value)
            }
        }
        
        return result
    }
}
```

We should also make sure that we know which spots are impacted when we fill another one
 
Let's build a copy of our board that will show the the possibilities of each spot. Then we will make sure to update all the spots once we fill one

```swift
struct Sudoku {
    var board: [[Int?]]
    var possibilitiesBoard: [[[Int]]]
    
    mutating func refreshPossibilityBoard() {        
        for i in 0..<board.count {
            let row = board[i]
            for j in 0..<row.count {
                if board[i][j] == nil {
                    let possibilities = board.possibilities(position: (i, j))
                    possibilitiesBoard[i][j] = possibilities
                } else {
                    possibilitiesBoard[i][j] = []
                }
            }
        }
    }
    
    func getPossibilitiesToUpdate(updatedElement: (row: Int, column: Int)) -> [(row: Int, column: Int)] {
        var result: [(row: Int, column: Int)] = []
        
        result.append(updatedElement)
        
        for index in 0...8 {
            if (index != updatedElement.row) {
                result.append((index, updatedElement.column))
            }
            
            if (index != updatedElement.column) {
                result.append((updatedElement.row, index))
            }
        }
        
        for position in board.getGridPositions(position: updatedElement) {
            if !(position.row == updatedElement.row && position.column == updatedElement.column) {
                result.append(position)
            }
        }
        
        return result
    }
    
    mutating func set(value: Int, position: (row: Int, column: Int)) {
        board[position.row][position.column] = value
        
        refreshPossibilityBoard()
    }
    
    func findNextElementToFill() -> (row: Int, column: Int)? {
        var resultValue: Int? = nil
        var result: (row: Int, column: Int)? = nil
        
        for i in 0..<possibilitiesBoard.count {
            let row = possibilitiesBoard[i]
            for j in 0..<row.count {
                if (!possibilitiesBoard[i][j].isEmpty) {
                    if resultValue != nil {
                        if possibilitiesBoard[i][j].count > 0 && possibilitiesBoard[i][j].count < resultValue! {
                            resultValue = possibilitiesBoard[i][j].count
                            result = (i, j)
                            
                            if resultValue == 1 {
                                return result!
                            }
                        }
                    } else {
                        resultValue = possibilitiesBoard[i][j].count
                        result = (i, j)
                        
                        if resultValue == 1 {
                            return result!
                        }
                    }
                }
            }
        }
        
        return result
    }
}
```

Let's build our function that solves the sudoku


```swift
extension Sudoku {
    mutating func proceed() {
        // We build the rankboard
        refreshPossibilityBoard()
        
        while true {
            guard let next = findNextElementToFill() else {
                print(board)
                return
            }
            
            let possibilities = board.possibilities(position: next)
            if let possibility = possibilities.first {
                set(value: possibility, position: next)
                print(board)
                print(possibilitiesBoard)
            }
        }
    }
}
```
## Test

```swift
class Problem_54Tests: XCTestCase {

    func test_1() {
        // available at http://www.sudokuessentials.com/how_to_play_sudoku.html
        let simplesudoku = [
            [4,1,nil,2,7,nil,8,nil,5],
            [nil,8,5,1,4,6,nil,9,7],
            [nil,7,nil,5,8,nil,nil,4,nil],
            [9,2,7,4,5,1,3,8,6],
            [5,3,8,6,9,7,4,1,2],
            [1,6,4,3,2,8,7,5,9],
            [8,5,2,7,nil,4,9,nil,nil],
            [nil,9,nil,8,nil,2,5,7,4],
            [7,4,nil,9,6,5,nil,2,8]
        ]
        let possibilityBoard: [[[Int]]] = Array(repeating: Array(repeating: [], count: 9), count: 9)
        
        var sudoku = Sudoku(board: simplesudoku, possibilitiesBoard: possibilityBoard)
        sudoku.refreshPossibilityBoard()
        
        sudoku.proceed()
    }

}
```