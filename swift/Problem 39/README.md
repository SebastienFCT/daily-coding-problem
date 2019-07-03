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

Our board will be define by a matrix (array of array) of Characters
 
- The character `.` is for a dead cell
- The character `*` is for a live cell

The rules are as follow:

- Live cells:
    - if (cell.liveNeighbourCount < 2) -> cell.dies()
    - if (cell.liveNeighbourCount == 2 || cell.liveNeighbourCount == 3) -> cell.lives()
    - if (cell.liveNeighbourCount > 3) -> cell.dies()
- Dead cells:
    - if (cell.liveNeighbourCount == 3) -> cell.lives()

We should be able to build a random board of living cells and run a certain amount of steps

Let's start by defininig function that determines how many live neighbours a cell has and how many dead ones it has

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
}
```

Ok, the test seemed ok, now we're going to implement our actual game of life and look at our cells evolving!
 
From here it should be straight forward, we will implement a function that takes an existing board and apply the 4 rules that we defines earlier.

One thing worth mentioning is that we will create a copy of the state at each iteration, the reason being is that is we change the cell dynamically, a changed cell might impact its neighbour.

```swift
extension Array where Element == Array<Character> {

    mutating func gameOfLive(iterations: Int) {
        var copy = self

        for _ in 0..<iterations {

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
            print(self)
        }
    }
}
```

If we want to extend this, I would first add an extra step every time I replace my board with its modified copy: I would add 2 columns and 2 rows (enlarge it)

```
extension Array where Element == Array<Character> {
    
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
            print(self)
        }
    }
}
```

Ok, the last part consist in displaying only the minimal possible board, I would just try to display both live or dead cell as I considered them being different than "no cell"

```
extension Array where Element == Array<Character> {
    
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

extension Array where Element == Array<Character> {
    
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