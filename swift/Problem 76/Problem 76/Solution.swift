//
//  Solution.swift
//  Problem 76
//
//  Created by sebastien FOCK CHOW THO on 2019-08-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    I would first write a function that can reverse my matrix (each column becomes a row) and run a function for each row checking if their elements are ordered alphabetically
 
 */
extension Array where Element == Array<Character> {
    
    private func flip() -> [[Character]] {
        var result: [[Character]] = []
        
        for i in 0..<self.count {
            
            var resultRow: [Character] = []
            
            for row in self {
                resultRow.append(row[i])
            }
            
            result.append(resultRow)
        }
        
        return result
    }
    
    func rowsToRemoveForLexicographicallyOrdered() -> (count: Int, indexes: [Int]) {
        
        var copy = self.flip()
        var count: Int = 0
        var indexes: [Int] = []
        
        for i in 0..<copy.count {
            let row = copy[i]
            
            if !row.isLexicographicallyOrdered() {
                count += 1
                indexes.append(i)
            }
        }
        
        return (count: count, indexes: indexes)
    }
}

extension Array where Element == Character {
    func isLexicographicallyOrdered() -> Bool {
        guard let first = first else {
            return true
        }
        
        var current: Character = first
        
        for i in 1..<self.count {
            guard current < self[i] else {
                return false
            }
            
            current = self[i]
        }
        
        return true
    }
}
