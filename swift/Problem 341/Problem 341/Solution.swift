//
//  Solution.swift
//  Problem 341
//
//  Created by sebastien FOCK CHOW THO on 2020-04-30.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias CharacterMatrix = [[Character]]

extension CharacterMatrix {
    
    typealias Pos = (row: Int, column: Int)
    
    func maximize(forList list: [String]) -> Int {
        
        return maxScore(forList: list)
    }
    
    private func maxScore(forList list: [String], currentPoint: Int = 0) -> Int {
        
        var maxPoints = currentPoint
        
        for index in 0..<list.count {
            let item = list[index]
            
            var newList = list
            newList.remove(at: index)
            
            guard let firstCharacter = item.first else {
                continue
            }
            
            for i in 0..<count {
                for j in 0..<self[i].count {
                    
                    if charAtPos(pos: (i, j)) == firstCharacter {
                        
                        var newWord = item
                        newWord.removeFirst()
                        
                        var copy = self
                        copy[i][j] = " "
                        
                        if let candidates = removeWord(word: newWord, matrix: copy, position: (i, j)) {
                            
                            for candidate in candidates {
                                
                                let nextScore = candidate.maxScore(forList: newList, currentPoint: currentPoint+1)
                                
                                maxPoints = Swift.max(nextScore, maxPoints)
                            }
                            
                        }
                        
                    }
                }
            }
        }
        
        return maxPoints
    }
    
    private func removeWord(word: String, matrix: CharacterMatrix, position: Pos) -> [CharacterMatrix]? {
        
        guard let firstCharacter = word.first else {
            return [matrix]
        }
        
        var candidates: [CharacterMatrix] = []
        
        if charAtPos(pos: (position.row-1, position.column)) == firstCharacter {
            
            var copy = matrix
            copy[position.row-1][position.column] = " "
            
            var newWord = word
            newWord.removeFirst()
            
            if let exists = removeWord(word: newWord, matrix: copy, position: (position.row-1, position.column)) {
                candidates.append(contentsOf: exists)
            }
        }
        
        if charAtPos(pos: (position.row+1, position.column)) == firstCharacter {
            
            var copy = matrix
            copy[position.row+1][position.column] = " "
            
            var newWord = word
            newWord.removeFirst()
            
            if let exists = removeWord(word: newWord, matrix: copy, position: (position.row+1, position.column)) {
                candidates.append(contentsOf: exists)
            }
        }
        
        if charAtPos(pos: (position.row, position.column-1)) == firstCharacter {
            
            var copy = matrix
            copy[position.row][position.column-1] = " "
            
            var newWord = word
            newWord.removeFirst()
            
            if let exists = removeWord(word: newWord, matrix: copy, position: (position.row, position.column-1)) {
                candidates.append(contentsOf: exists)
            }
        }
        
        if charAtPos(pos: (position.row, position.column+1)) == firstCharacter {
            
            var copy = matrix
            copy[position.row][position.column+1] = " "
            
            var newWord = word
            newWord.removeFirst()
            
            if let exists = removeWord(word: newWord, matrix: copy, position: (position.row, position.column+1)) {
                candidates.append(contentsOf: exists)
            }
        }
        
        
        return candidates
    }
    
    private func charAtPos(pos: Pos) -> Character? {
        
        if pos.row < 0 || pos.column < 0 || pos.row >= count || pos.column >= self[0].count {
            return nil
        }
        
        return self[pos.row][pos.column]
    }
}
