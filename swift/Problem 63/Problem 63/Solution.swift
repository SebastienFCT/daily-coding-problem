//
//  Solution.swift
//  Problem 63
//
//  Created by sebastien FOCK CHOW THO on 2019-07-27.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    First we will write a function that find any position that matches the first character of the string
 
 */
extension Array where Element == Array<String> {
    func find(character: String) -> [(row: Int, column: Int)] {
        var result: [(row: Int, column: Int)] = []
        
        for i in 0..<self.count {
            for j in 0..<self[i].count {
                if self[i][j] == character {
                    result.append((i, j))
                }
            }
        }
        
        return result
    }
}
/**
 
    Ok so now we have multiple potential candidate for the solution, we need to check against each of them until we find the word
 
 */
extension Array where Element == Array<String> {
    func runAgainst(word: String, startingAt: (row: Int, column: Int)) -> Bool {
        var row = ""
        var column = ""
        
        for i in startingAt.row..<word.count+startingAt.row {
            if i >= self.count {
                break
            }
            
            row += "\(self[i][startingAt.column])"
        }
        
        for j in startingAt.column..<word.count+startingAt.column {
            if j >= self[startingAt.row].count {
                break
            }
            
            column += "\(self[startingAt.row][j])"
        }
        
        return row == word || column == word
    }
    
    func has(word: String) -> Bool {
        let possibilities = find(character: String(word.first ?? Character("")))
        
        for possibility in possibilities {
            if runAgainst(word: word, startingAt: possibility) {
                return true
            }
        }
        
        return false
    }
}
