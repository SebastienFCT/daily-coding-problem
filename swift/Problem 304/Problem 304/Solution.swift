//
//  Solution.swift
//  Problem 304
//
//  Created by sebastien FOCK CHOW THO on 2020-03-24.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

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
