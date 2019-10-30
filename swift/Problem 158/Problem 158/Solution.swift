//
//  Solution.swift
//  Problem 158
//
//  Created by sebastien FOCK CHOW THO on 2019-10-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Int> {
    
    typealias Position = (row: Int, column: Int)
    
    func pathCountFromTopLeftToBottomRight() -> Int {
        return pathCounter(from: (0,0), to: (count-1, self[count-1].count-1))
    }
    
    func pathCounter(from: Position, to: Position) -> Int {
        var result = 0
        
        if from.row == to.row && from.column == to.column {
            return 1
        }
        
        var newArray = self
        newArray[from.row][from.column] = 1
        
        let allCandidates = candidates(from: from)
        
        for candidate in allCandidates {
            result += newArray.pathCounter(from: candidate, to: to)
        }
        
        return result
    }
    
    func candidates(from: Position) -> [Position] {
        var positions: [Position] = []
        
        if let top = takeIfExist(position: (from.row-1, from.column)), top == 0 {
            positions.append((from.row-1, from.column))
        }

        if let bottom = takeIfExist(position: (from.row+1, from.column)), bottom == 0 {
            positions.append((from.row+1, from.column))
        }
        
        if let left = takeIfExist(position: (from.row, from.column-1)), left == 0 {
            positions.append((from.row, from.column-1))
        }
        
        if let right = takeIfExist(position: (from.row, from.column+1)), right == 0 {
            positions.append((from.row, from.column+1))
        }
        
        return positions
    }
    
    func takeIfExist(position: Position) -> Int? {
        if position.row < 0 || position.column < 0 || position.row >= count || position.column >= self[position.row].count {
            return nil
        }
        
        return self[position.row][position.column]
    }
}
