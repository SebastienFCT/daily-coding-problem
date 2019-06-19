//
//  Solution.swift
//  Problem 1
//
//  Created by sebastien FOCK CHOW THO on 2019-06-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    Since we're only looking for a pair, the simplest way to implement this to me is to loop through the elements and progressively add them to a set.
 
    For each element, we check if (expected value) - element = (any value in my set)
 
 */
extension Array where Element == Int {
    func hasPairForSum(sum k: Int) -> Bool {
        
        var set: Set<Int> = Set()
        
        for element in self {
            if set.contains(where: { (value) -> Bool in
                k - element == value
            }) {
                return true
            }
            
            set.insert(element)
        }
        
        return false
    }
}

/**
 
    Now let's say that the requirements change. We want to be able to determine if for a given array of integers, there is any combination of N elements which sum return K
 
    Since we're doing a sum, the order doesn't really matters, so we're going to build all the possible combinations as we're drawing our elements
 
    Imagine that you have the input [0, 1, 2, 3] and you're looking for a combination of 3 elements, the possibilities are:
    - [0, 1, 2]
    - [0, 1, 3]
    - [0, 2, 3]
    - [1, 2, 3]
 
    Another way to visualize it is to imagine trees:
 
    - 0
      | - 1
          | - 2
          | - 3
      | - 2
          | - 3
    - 1
      | - 2
          | - 3
 
    Since the order doesn't matter, we can build the branches of a tree based on the "rest" of the sub-array (the initial array minus all elements before the current node element). We also stop the process when there is n = k-1 elements in the array
 
    Let's build a branch structure that can hold other branches:
 
 */
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
/**
 
    Now we need a function that build children branches. Basically we need to tell a branch:
 
    "grow more branches up to level X"
 
    Let's build a trunk structure that can tell the branches "how far" they can extend
    EDIT: I realized that a trunk is actually just a branch (with the exception that it was holding a "maxValue") so I decided to refactor my code
 
 */
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
/**
 
    Now we need to build a function that determine if any of the last branches (and their extension) in the tree correspond to our expected sum
 
 */
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
/**
 
    Here we decided the build the "Tree" and then check reduce its branches to the sum, we could instead build the branches progressively and stop as soon as we get a valid result (since we're not expecting all the results)
 
 */
