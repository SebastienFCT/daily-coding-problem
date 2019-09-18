//
//  Solution.swift
//  Problem 1b
//
//  Created by sebastien FOCK CHOW THO on 2019-09-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Branch {
    var value: Int
    var maxLevel: Int
    var level: Int
    var rest: [Int]
    var branches: [Branch]
    
    init(value: Int, maxLevel: Int, level: Int, rest: [Int]) {
        self.value = value
        self.maxLevel = maxLevel
        self.level = level
        self.rest = rest
        self.branches = []
    }
}

extension Branch {
    func growBranches() {
        // If we reached the last level, we stop
        if level == maxLevel {
            return
        }
        
        // If there isn't enough element just stop
        if rest.count < maxLevel - level {
            return
        }
        
        branches = []
        
        for i in 0...(rest.count - maxLevel + level) {
            let branch = Branch(value: (value - rest[i]), maxLevel: maxLevel, level: level+1, rest: rest.enumerated().filter{ $0.offset != i }.map{ $0.element })
            branches.append(branch)
        }
        
        for branch in branches {
            branch.growBranches()
        }
    }
}

extension Branch {
    func anyPathForValue() -> Bool {
        let newValue = value - self.value
        
        if level == maxLevel && newValue > 0 {
            return false
        }
        
        if level == maxLevel && newValue == 0 {
            return true
        }
        
        for branch in branches {
            if branch.anyPathForValue() {
                return true
            }
        }
        
        return false
    }
}
