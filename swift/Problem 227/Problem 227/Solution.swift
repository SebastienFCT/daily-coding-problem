//
//  Solution.swift
//  Problem 227
//
//  Created by sebastien FOCK CHOW THO on 2020-01-07.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Boggle {
    
    func allSolutions(forDictionary: [String], board: Boggleboard) -> [BoggleSolution] {
        var result: [BoggleSolution] = []
        
        for i in 0...3 {
            for j in 0...3 {
                let positions: [Position] = [(i, j)]
                let term = board[i][j]

                var copy = board
                copy[i][j] = "_"
                result.append(contentsOf: solutions(withDictionary: forDictionary, andBoard: board, andTerm: "\(term)", withPositions: positions))
            }
        }
        
        return result
    }
    
    func solutions(withDictionary dictionary: [String], andBoard board: Boggleboard, andTerm term: String, withPositions positions: [Position], andNext next: Position) -> (exists: Bool, newDictionary: [String], newBoard: Boggleboard, newTerm: String, newPositions: [Position])? {
        
        guard !dictionary.isEmpty else {
            return nil
        }
        
        guard let character = board.characterAtPosition(position: next) else {
            return nil
        }
        
        var exists = false
        
        let newTerm = "\(term)\(character)"
        
        let newPosition = (next.row, next.column)
        var newPositions = positions
        newPositions.append(newPosition)
        
        var newBoard = board
        newBoard[next.row][next.column] = "_"
        
        var newDictionary = dictionary.filter{ $0[0...newTerm.count-1] == newTerm }
        if newDictionary.contains(newTerm) {
            newDictionary.removeAll { (value) -> Bool in
                value == newTerm
            }
            
            exists = true
        }
        
        return (exists, newDictionary, newBoard, newTerm, newPositions)
    }
    
    func solutions(withDictionary dictionary: [String], andBoard board: Boggleboard, andTerm term: String, withPositions positions: [Position]) -> [BoggleSolution] {
        
        var result: [BoggleSolution] = []
        
        let position = positions.last!
        
        let neighbours: [Position] = [
            (position.row, position.column-1),
            (position.row+1, position.column-1),
            (position.row+1, position.column),
            (position.row+1, position.column+1),
            (position.row, position.column+1),
            (position.row-1, position.column+1),
            (position.row-1, position.column),
            (position.row-1, position.column-1)
        ]
        
        for neighbour in neighbours {
            if let next = solutions(withDictionary: dictionary, andBoard: board, andTerm: term, withPositions: positions, andNext: (neighbour.row, neighbour.column)) {
                if next.exists { result.append((next.newTerm, next.newPositions)) }
                result.append(contentsOf: solutions(withDictionary: next.newDictionary, andBoard: next.newBoard, andTerm: next.newTerm, withPositions: next.newPositions))
            }
        }
        
        return result
    }
}

// MARK: - Utilities

typealias Position = (row: Int, column: Int)
typealias Boggleboard = [[Character]]
typealias BoggleSolution = (word: String, positions: [Position])

extension Boggleboard {
    func characterAtPosition(position: Position) -> Character? {
        
        if position.row < 0 || position.row > 3 || position.column < 0 || position.column > 3 {
            return nil
        }
        
        if self[position.row][position.column] == "_" {
            return nil
        }
        
        return self[position.row][position.column]
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: CountableRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: CountablePartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
