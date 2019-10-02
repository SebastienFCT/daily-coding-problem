## Description

This problem was asked by Dropbox.

Conway's Game of Life takes place on an infinite two-dimensional board of square cells. Each cell is either dead or alive, and at each tick, the following rules apply:

Any live cell with less than two live neighbours dies.
Any live cell with two or three live neighbours remains living.
Any live cell with more than three live neighbours dies.
Any dead cell with exactly three live neighbours becomes a live cell.
A cell neighbours another cell if it is horizontally, vertically, or diagonally adjacent.

Implement Conway's Game of Life. It should be able to be initialized with a starting list of live cell coordinates and the number of steps it should run for. Once initialized, it should print out the board state at each step. Since it's an infinite board, print out only the relevant coordinates, i.e. from the top-leftmost live cell to bottom-rightmost live cell.

You can represent a live cell with an asterisk (`*`) and a dead cell with a dot (`.`).

## Solution

```swift
extension Array where Element == Array<Character> {
    
    func neighbourCount(row: Int, column: Int) -> (live: Int, dead: Int) {
        var liveCellCount = 0
        var deadCellCount = 0
        
        for i in row-1...row+1 {
            for j in column-1...column+1 {
                if let isNeighbourAlive = isCellAlive(row: i, column: j) {
                    if i == row && j == row { continue }
                    
                    if isNeighbourAlive {
                        liveCellCount += 1
                    } else {
                        deadCellCount += 1
                    }
                }
            }
        }
        
        return (liveCellCount, deadCellCount)
    }
    
    // This convenient function avoid us to check if the neighbour cell exists (out of bound exceptions)
    func isCellAlive(row: Int, column: Int) -> Bool? {
        guard row >= 0 && column >= 0 else {
            return nil
        }
        
        if row == self.count || column == self[0].count {
            return nil
        }
        
        return self[row][column] == "*"
    }
    
    mutating func gameOfLive(iterations: Int) {
        for _ in 0..<iterations {
            
            for i in 0..<self.count {
                self[i].insert(" ", at: 0)
                self[i].append(" ")
            }
            
            var emptyRow: [Character] = []
            for _ in 0..<self[0].count {
                emptyRow.append(" ")
            }
            
            self.insert(emptyRow, at: 0)
            self.append(emptyRow)
            
            var copy = self
            
            for i in 0..<self.count {
                for j in 0..<self[0].count {
                    switch self[i][j] {
                    case "*":
                        if self.neighbourCount(row: i, column: j).live != 2 && self.neighbourCount(row: i, column: j).live != 3 {
                            copy[i][j] = "."
                        }
                    case ".":
                        if self.neighbourCount(row: i, column: j).live == 3 {
                            copy[i][j] = "*"
                        }
                    default:
                        break
                    }
                }
            }
            
            self = copy
            self.minimize()
            print(self)
        }
    }
    
    mutating func minimize() {
        while true {
            if (self.map{ $0.first ?? "." }.filter{ $0 != " " }.count == 0) {
                for i in 0..<self.count {
                    self[i].removeFirst()
                }
            } else {
                break
            }
        }
        
        while true {
            if (self.map{ $0.last ?? "." }.filter{ $0 != " " }.count == 0) {
                for i in 0..<self.count {
                    self[i].removeLast()
                }
            } else {
                break
            }
        }
        
        while true {
            if (self[0].filter{ $0 != " " }.count == 0) {
                self.removeFirst()
            } else {
                break
            }
        }
        
        while true {
            if let last = self.last {
                if (last.filter{ $0 != " " }.count == 0) {
                    self.removeLast()
                } else {
                    break
                }
            } else {
                break
            }
        }
    }
}
```

## Tests

```swift
class Problem_39Tests: XCTestCase {

    func test_1() {
        let input: [[Character]] = [
            [".", ".", "."],
            ["*", "*", "."],
            [".", ".", "*"]
        ]
        
        XCTAssert(input.neighbourCount(row: 1, column: 1) == (live: 2, dead: 6))
        XCTAssert(input.neighbourCount(row: 2, column: 2) == (live: 1, dead: 2))
        XCTAssert(input.neighbourCount(row: 1, column: 0) == (live: 1, dead: 4))
    }
    
    func test_2() {
        var input: [[Character]] = [
            [" ", "*", "*", "*", " ", " "],
            ["*", "*", " ", "*", "*", "*"],
            ["*", " ", "*", " ", " ", "*"],
            [" ", " ", " ", "*", " ", "*"],
            ["*", "*", " ", " ", "*", "*"],
            [" ", "*", " ", "*", "*", " "]
        ]
        
        print(input.neighbourCount(row: 0, column: 0))
        input.gameOfLive(iterations: 10)
    }

}
```