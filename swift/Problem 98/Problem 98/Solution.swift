//
//  Solution.swift
//  Problem 98
//
//  Created by sebastien FOCK CHOW THO on 2019-08-31.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Character> {
    
    typealias MatrixPos = (row: Int, column: Int)
    
    func exists(word: String) -> Bool {
        var candidates: [MatrixPos] = []
        
        var wordCopy = word
        let character = wordCopy.removeFirst()
        
        for i in 0..<self.count {
            for j in 0..<self[i].count {
                let item = self[i][j]
                
                if item == character {
                    candidates.append((row: i, column: j))
                }
            }
        }
        
        for candidate in candidates {
            if find(word: wordCopy, fromPosition: candidate) {
                return true
            }
        }
        
        return false
    }
    
    private func find(word: String, fromPosition position: MatrixPos) -> Bool {
        
        var result: [([[Character]], MatrixPos)] = []
        
        var wordCopy = word
        let character = wordCopy.removeFirst()
        
        if left(of: position) == character {
            var copy = self
            copy[position.row][position.column-1] = "*" // We use an asterisk as "not a character", this would break if the word to find included an asterisk
            result.append((copy, (row: position.row, column: position.column-1)))
        }
        
        if right(of: position) == character {
            var copy = self
            copy[position.row][position.column+1] = "*"
            result.append((copy, (row: position.row, column: position.column+1)))
        }
        
        if top(of: position) == character {
            var copy = self
            copy[position.row-1][position.column] = "*"
            result.append((copy, (row: position.row-1, column: position.column)))
        }
        
        if bottom(of: position) == character {
            var copy = self
            copy[position.row+1][position.column] = "*"
            result.append((copy, (row: position.row+1, column: position.column)))
        }
        
        if wordCopy.isEmpty {
            return !result.isEmpty
        }
        
        for item in result {
            if item.0.find(word: wordCopy, fromPosition: item.1) {
                return true
            }
        }
        
        return false
    }
    
    private func left(of position: MatrixPos) -> Character? {
        
        if position.column - 1 >= 0 {
            return self[position.row][position.column-1]
        }
        
        return nil
    }
    
    private func right(of position: MatrixPos) -> Character? {
        
        if position.column + 1 < self[position.row].count {
            return self[position.row][position.column+1]
        }
        
        return nil
    }
    
    private func top(of position: MatrixPos) -> Character? {
        
        if position.row - 1 >= 0 {
            return self[position.row-1][position.column]
        }
        
        return nil
    }
    
    private func bottom(of position: MatrixPos) -> Character? {
        
        if position.row + 1 < self.count {
            return self[position.row+1][position.column]
        }
        
        return nil
    }
}
