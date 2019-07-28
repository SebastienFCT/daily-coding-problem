## Description

This problem was asked by Google.

A knight's tour is a sequence of moves by a knight on a chessboard such that all squares are visited once.

Given N, write a function to return the number of knight's tours on an N by N chessboard.

## Solution

A knight in the Chess game moves in an L shape (1 tile to a direction and 2 tiles in a perpendicular direction.
 
For this challenge, we should start writing a function that find all next possible moves for the knight.

The second part will consist in building a recursive function that register all the moves and stops when the board has been fully "explored".

We can use a board of integers set to 0 and turn them to 1 as the knight moves

```swift
protocol ChessPiece {
    var position: (row: Int, column: Int) { get set }
    var board: [[Int]] { get set }
    
    func possibleMoves() -> [(row: Int, column: Int)]
}
```

The moves of the knight are as follow:

``` 
0 - 1 - 0 - 1 - 0
1 - 0 - 0 - 0 - 1
0 - 0 - K - 0 - 0
1 - 0 - 0 - 0 - 1
0 - 1 - 0 - 1 - 0
```

With K being the knight and the 1 the possible moves

```swift
struct Knight: ChessPiece {
    var position: (row: Int, column: Int)
    var board: [[Int]]
    
    func possibleMoves() -> [(row: Int, column: Int)] {
        var result: [(row: Int, column: Int)] = []
        
        result.append((position.row-2, position.column+1))
        result.append((position.row-1, position.column+2))
        result.append((position.row+1, position.column+2))
        result.append((position.row+2, position.column+1))
        result.append((position.row-2, position.column-1))
        result.append((position.row-1, position.column-2))
        result.append((position.row+1, position.column-2))
        result.append((position.row+2, position.column-1))
        
        return result.filter{ board.isInBoad(position: $0) }.filter{ board[$0.row][$0.column] != 1 }
    }
    
    // move() proceed the next move and update the board. We don't want to mutate the original board as there are more than one possible move
    func move(position: (row: Int, column: Int)) -> [[Int]] {
        var copy = board
        
        copy[position.row][position.column] = 1
        
        return copy
    }
    
    func countTours() -> Int {
        let possibilities = possibleMoves()
        
        if possibilities.isEmpty {
            return 0
        }
        
        var result = 0
        
        for possibility in possibilities {
            let newBoard = move(position: possibility)
            
            if newBoard.fullyVisited() {
                result += 1
            } else {
                let knight = Knight(position: possibility, board: newBoard)
                result += knight.countTours()
            }
        }
        
        return result
    }
}

internal extension Array where Element == Array<Int> {
    func isInBoad(position: (row: Int, column: Int)) -> Bool {
        return position.row >= 0 && position.column >= 0 && position.row < self.count && position.column < self[position.row].count
    }
    
    func fullyVisited() -> Bool {
        
        for row in self {
            for element in row {
                if element == 0 {
                    return false
                }
            }
        }
        
        return true
    }
}
```

## Test

```swift
class Problem_64Tests: XCTestCase {

    func test_example() {
        let board = [
            [0,0,0,0,0],
            [0,0,0,0,0],
            [0,0,1,0,0],
            [0,0,0,0,0],
            [0,0,0,0,0]
        ]
        
        let knight = Knight(position: (2,2), board: board)
        print(knight.countTours())
    }

}
```