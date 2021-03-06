## Description

This problem was asked by Two Sigma.

A knight is placed on a given square on an 8 x 8 chessboard. It is then moved randomly several times, where each move is a standard [knight move](https://en.wikipedia.org/wiki/Knight_(chess)#Movement). If the knight jumps off the board at any point, however, it is not allowed to jump back on.

After k moves, what is the probability that the knight remains on the board?

## Solution

```swift
typealias Position = (row: Int, column: Int)
typealias Move = (row: Int, column: Int)

struct ChessExperiments {
    
    private let knightMoves: [Move] = [(2, 3), (2, -3), (-2, 3), (-2, -3), (3, 2), (3, -2), (-3, 2), (-3, -2)]
    
    func knightProbabityToRemainOnBoard(boardDimension: Int, position: Position, afterTotalMove k: Int, sampleSize: Int) -> Double {
        
        guard position.row >= 0 && position.row < boardDimension && position.column >= 0 && position.column < boardDimension else {
             return 0
        }
        
        var successes: Double = 0
        var failures: Double = 0
        
        for _ in 1...sampleSize {
            
            var currentPos = position
            var remainsOnBoard = true
            
            for _ in 1...k {
                
                let randomMove = knightMoves[Int.random(in: 0..<knightMoves.count)]
                let nextPosition: Position = ((currentPos.row + randomMove.row), (currentPos.column + randomMove.column))
                
                if !(nextPosition.row >= 0 && nextPosition.row < boardDimension && nextPosition.column >= 0 && nextPosition.column < boardDimension) {
                    remainsOnBoard = false
                    break
                }
                
                currentPos = nextPosition
                
            }
            
            if remainsOnBoard {
                successes += 1
            } else {
                failures += 1
            }
        }
        
        let probability = successes / (successes + failures)
        
        return probability
    }
}
```

## Tests

```swift
class Problem_304Tests: XCTestCase {

    func test_chess_knight_experiment() {
        
        let ce = ChessExperiments()
        
        print(ce.knightProbabityToRemainOnBoard(boardDimension: 8, position: (2, 2), afterTotalMove: 1, sampleSize: 10000))
    }

}
```