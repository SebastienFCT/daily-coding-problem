//
//  Solution.swift
//  Problem 68
//
//  Created by sebastien FOCK CHOW THO on 2019-08-01.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    I would solve this problem in two steps:
 
    - First I would write appropriate extensions to find bishops that are on the same diagonales
    - Second, I would write the actual logic where I create a set of pairs for each pair of bishop that would attack each other. I would have to make sure that two pair are the same for the following condition: (a, b) = (a, b) and (a, b) = (b, a)
 
    Let's start with the extension and utilities
 
    Note: rather than using 'b' for bishop, I will use the integer 1, this way I can extend a matric of integers
 
 */
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
/**
 
    Now we write our function exploiting the utilities methods
 
 */
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
