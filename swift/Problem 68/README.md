## Description

This problem was asked by Google.

On our special chessboard, two bishops attack each other if they share the same diagonal. This includes bishops that have another bishop located between them, i.e. bishops can attack through pieces.

You are given N bishops, represented as (row, column) tuples on a M by M chessboard. Write a function to count the number of pairs of bishops that attack each other. The ordering of the pair doesn't matter: (1, 2) is considered the same as (2, 1).

For example, given M = 5 and the list of bishops:

- (0, 0)
- (1, 2)
- (2, 2)
- (4, 0)

The board would look like this:

```
[b 0 0 0 0]
[0 0 b 0 0]
[0 0 b 0 0]
[0 0 0 0 0]
[b 0 0 0 0]
```

You should return 2, since bishops 1 and 3 attack each other, as well as bishops 3 and 4.

## Solution

```swift
extension Array where Element == Array<Int> {
    func positionOfBishopsOnDiagonal(position: (row: Int, column: Int)) -> [((row: Int, column: Int), (row: Int, column: Int))] {
        var result: [((row: Int, column: Int), (row: Int, column: Int))] = []
        
        for candidate in diagonals(position: position) {
            if self[candidate.row][candidate.column] == 1 {
                result.append((position, candidate))
            }
        }
        
        return result
    }
    
    // This assumes that the matrix' rows have the same length as its columnns
    func diagonals(position: (row: Int, column: Int)) -> [(row: Int, column: Int)] {
        var result: [(row: Int, column: Int)] = []
        
        // top left
        var x = position.row
        var y = position.column
        
        while x > 0 && y > 0 {
            x -= 1
            y -= 1
            result.append((x, y))
        }
        
        // top right
        x = position.row
        y = position.column
        
        while x < count-1 && y > 0 {
            x += 1
            y -= 1
            result.append((x, y))
        }
        
        // bottom right
        x = position.row
        y = position.column
        
        while x < count-1 && y < count-1 {
            x += 1
            y += 1
            result.append((x, y))
        }
        
        // bottom left
        x = position.row
        y = position.column
        
        while x > 0 && y < count-1 {
            x -= 1
            y += 1
            result.append((x, y))
        }
        
        return result
    }
}

struct BishopWar {
    var board: [[Int]]
    
    func bishopConflictCount() -> Int {
        var result: [((row: Int, column: Int), (row: Int, column: Int))] = []
        
        for bishop in board.findBishops() {
            result.append(contentsOf: board.positionOfBishopsOnDiagonal(position: (bishop.row, bishop.column)))
        }
        
        // Now we need to make sure that we remove potential duplicates
        var filtered: [((row: Int, column: Int), (row: Int, column: Int))] = []
        
        print(result)
        for couple in result {
            if !filtered.contains(where: { (aCouple) -> Bool in
                aCouple == couple
            }) {
                filtered.append(couple)
            }
        }
        
        return filtered.count
    }
}

// This extension helps me to find all bishops
extension Array where Element == Array<Int> {
    func findBishops() -> [(row: Int, column: Int)] {
        var result: [(row: Int, column: Int)] = []
        
        for i in 0..<self.count {
            for j in 0..<self[i].count {
                if self[i][j] == 1 {
                    result.append((i, j))
                }
            }
        }
        
        return result
    }
}

// Custom equatable to compare my tuples
func == (left: (row: Int, column: Int), right: (row: Int, column: Int)) -> Bool {
    return left.row == right.row && left.column == right.column
}

func == (left: ((row: Int, column: Int), (row: Int, column: Int)), right: ((row: Int, column: Int), (row: Int, column: Int))) -> Bool {
    return (left.0 == right.0 && left.1 == right.1) || (left.1 == right.0 && left.0 == right.1)
}
```

## Test

```swift
class Problem_68Tests: XCTestCase {

    func test_diagonals() {
        let input = [
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0]
        ]
        
        print(input.diagonals(position: (2, 2)))
    }

    func test_example() {
        let board = [
            [1,0,0,0,0],
            [0,0,1,0,0],
            [0,0,1,0,0],
            [0,0,0,0,0],
            [1,0,0,0,0]
        ]
        
        let bishopWar = BishopWar(board: board)
        XCTAssert(bishopWar.bishopConflictCount() == 2)
    }
}
```