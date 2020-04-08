//
//  Solution.swift
//  Problem 319
//
//  Created by sebastien FOCK CHOW THO on 2020-04-08.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

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
            
            result.append(contentsOf: copy.solve(previousStates: newStates, currentPos: (pos.row, pos.column)))
        }
        
        return result
        
    }
}
