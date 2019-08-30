//
//  Solution.swift
//  Problem 96
//
//  Created by sebastien FOCK CHOW THO on 2019-08-29.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func allPermutations() -> [[Int]] {
        var result: [[Int]] = []
        
        for i in 0..<count {
            var copyCandidate = self
            
            result.append(contentsOf: [copyCandidate.remove(at: i)].next(candidates: copyCandidate))
        }
        
        return result
    }
    
    func next(candidates: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        
        for i in 0..<candidates.count {
            var copy = self
            var copyCandidates = candidates
            
            copy.append(copyCandidates.remove(at: i))
            
            if copyCandidates.isEmpty {
                result.append(contentsOf: [copy])
            } else {
                result.append(contentsOf: copy.next(candidates: copyCandidates))
            }
        }
        
        return result
    }
}
