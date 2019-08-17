//
//  Solution.swift
//  Problem 84
//
//  Created by sebastien FOCK CHOW THO on 2019-08-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    I'll try to build a function that finds a land (1) and adds all connected lands to it
 
 */

typealias Position2D = (row: Int, column: Int)

extension Array where Element == Array<Int> {
    
    // Function solution
    func countIslands() -> Int {
        let allLands = lands()
        return mergeIslands(islands: allLands).count
    }
    
    // Lands return every single land (referenced by their position in the 2D plan)
    func lands() -> [[Position2D]] {
        var islands: [[Position2D]] = []
        
        for i in 0..<count {
            for j in 0..<self[i].count {
                if self[i][j] == 1 {
                    islands.append([(row: i, column: j)])
                }
            }
        }
        
        return islands
    }
    
    // Merge group couples together based on whether they touch each other (see below `connected` function
    func mergeIslands(islands: [[Position2D]]) -> [[Position2D]] {
        var copy = islands
        var newIslands: [[Position2D]] = []
        var hasChanged = false
        
        while !copy.isEmpty {
            if newIslands.isEmpty || copy.count == 1 {
                newIslands.append(copy.removeFirst())
                continue
            }
            
            let current = copy.removeFirst()
            
            for i in 0..<copy.count {
                if connected(lefts: current, rights: copy[i]) {
                    hasChanged = true
                    var merged = copy[i]
                    merged.append(contentsOf: current)
                    newIslands.append(merged)
                    
                    copy.remove(at: i)
                    break
                }
                
                if i == copy.count-1 {
                    newIslands.append(current)
                }
            }
        }
        
        print(newIslands)
        
        if hasChanged {
            return mergeIslands(islands: newIslands)
        } else {
            return newIslands
        }
    }
}

func connected(lefts: [Position2D], rights: [Position2D]) -> Bool {
    
    for right in rights {
        for left in lefts {
            if left.row == right.row && abs(left.column-right.column) == 1 {
                return true
            }
            
            if left.column == right.column && abs(left.row-right.row) == 1 {
                return true
            }
        }
    }
    
    return false
}
