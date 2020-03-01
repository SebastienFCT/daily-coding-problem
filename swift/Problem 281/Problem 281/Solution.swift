//
//  Solution.swift
//  Problem 281
//
//  Created by sebastien FOCK CHOW THO on 2020-03-01.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Wall {
    
    var stack: [[Int]]
    
    func optimalCut() -> Int {
        
        guard stack.count > 0 else {
            return 0
        }

        let maxLength = stack.map{ $0.reduce(0, { $0 + $1 }) }.sorted{ $0 > $1 }.first!
        var cuts: [Int: Int] = [:]
        
        for i in 1..<maxLength {
            
            var cutCount = 0
            
            for row in stack {
                if row.isCutting(position: i) {
                    cutCount += 1
                }
            }
            
            cuts[i] = cutCount
        }
        
        let sorted = cuts.sorted{ $0.1 < $1.1 }
        
        return sorted.first!.key
    }
}

typealias BrickRow = [Int]

extension BrickRow {
    
    func isCutting(position: Int) -> Bool {
        
        var current = 0
        
        for brick in self {
            
            current += brick
            
            if position < current {
                return true
            }
            
            if position == current {
                return false
            }
        }
        
        return false
    }
}
