//
//  Solution.swift
//  Problem 62
//
//  Created by sebastien FOCK CHOW THO on 2019-07-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    For this problem, we can use a tree structure that reveals all possible path
 
    To find what are the possible moves, we will replace the position already visited by 1
 
    Let's start by writing quick utility functions to find all possible next moves and another move
 
 */
extension Array where Element == Array<Int> {
    
    func possibilities(current: (row: Int, column: Int)) -> [(row: Int, column: Int)] {
        var result: [(row: Int, column: Int)] = []
        
        if current.row+1 < self.count {
            if self[current.row+1][current.column] == 0 {
                result.append((row: current.row+1, column: current.column))
            }
        }
        
        if current.column+1 < self[current.row].count {
            if self[current.row][current.column+1] == 0 {
                result.append((row: current.row, column: current.column+1))
            }
        }
        
        return result
    }
    
    func move(row: Int, column: Int) -> [[Int]] {
        var copy = self
        
        copy[row][column] = 1
        
        return copy
    }
}
/**
 
    Now I can use these method to calculate all path to get from (0,0) to (maxRow,maxColumn)
 
 */
extension Array where Element == Array<Int> {
    func pathCount(current: (row: Int, column: Int), to: (row: Int, column: Int)) -> Int {
        var result = 0
        
        let allPossibilities = possibilities(current: current)
        
        if allPossibilities.isEmpty {
            return 0
        }
        
        for possibility in allPossibilities {
            if possibility == to {
                result += 1
            } else {
                let newArray = move(row: possibility.row, column: possibility.column)
                result += newArray.pathCount(current: possibility, to: to)
            }
        }
        
        return result
    }
}
