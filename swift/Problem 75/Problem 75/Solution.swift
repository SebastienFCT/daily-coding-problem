//
//  Solution.swift
//  Problem 75
//
//  Created by sebastien FOCK CHOW THO on 2019-08-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    I want to build a function that builds all the path in a tree,
 
    So 0 would have the following branches:  [8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]
 
    An the first branch would result in [0-8] with the rest  [4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]
 
    The next branches would be [12, 10, 14, 9, 13, 11, 15]
 
    And so on...
 
 */
struct Node {
    var current: [Int]
    var rest: [Int]
    var candidates: [Node]
    
    init(current: [Int], rest: [Int], candidates: [Node]) {
        self.current = current
        self.rest = rest
        self.candidates = candidates
    }
    
    mutating func buildRootCandidates() {
        var newCandidates: [Node] = []
        
        for i in 0..<rest.count {
            let element = rest[i]
            let newRest = Array(rest.suffix(rest.count-1-i))
            
            var node = Node(current: [element], rest: newRest, candidates: [])
            node.generateCandidates()
            newCandidates.append(node)
        }
        
        self.candidates = newCandidates
    }
    
    private mutating func generateCandidates() {
        guard let last = current.last else {
            return
        }
        
        let possibilities = rest.ascendingSeqCandidates(forValue: last)
        
        var newCandidates: [Node] = []
        
        for possibility in possibilities {
            guard let first = possibility.first else {
                continue
            }
            
            let newCurrent = current + [first]
            let newRest = Array(possibility.suffix(possibility.count-1))
            
            var node = Node(current: newCurrent, rest: newRest, candidates: [])
            node.generateCandidates()
            newCandidates.append(node)
        }
        
        self.candidates = newCandidates
    }
    
    func getAllAscendingSequences() -> [[Int]] {
        var result: [[Int]] = []
        
        for candidate in candidates {
            if candidate.candidates.isEmpty {
                result.append(candidate.current)
            } else {
                result.append(contentsOf: candidate.getAllAscendingSequences())
            }
        }
        
        return result
    }
}

extension Array where Element == Int {
    func ascendingSeqCandidates(forValue value: Int) -> [[Int]] {
        var result: [[Int]] = []
        
        for i in 0..<self.count {
            let current = self[i]
            
            if current > value {
                result.append(self.suffix(self.count-i))
            }
        }
        
        return result
    }
}
