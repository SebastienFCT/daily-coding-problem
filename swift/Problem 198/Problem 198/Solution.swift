//
//  Solution.swift
//  Problem 198
//
//  Created by sebastien FOCK CHOW THO on 2019-12-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    /// find the largest subset such that every pair of elements in the subset (i, j) satisfies either i % j = 0 or j % i = 0.
    /// input must not have duplicates
    func largestSetWherePairsAreMultiple() -> [Int] {
        
        guard count == Set(self).count else {
            fatalError("`largestSetWherePairsAreMultiple()` does not accept duplicates")
        }
        
        let candidates = candidatesForLargestSetWherePairsAreMultiple()
        let sorted = candidates.sorted{ $0.count > $1.count }
        
        return sorted.first ?? []
    }
    
    private func candidatesForLargestSetWherePairsAreMultiple() -> [[Int]] {
        
        var result: [[Int]] = []
        
        if areAllPairsMultiple() {
            result.append(self)
        } else {
            for i in 0..<count {
                var copy = self
                copy.remove(at: i)
                
                result.append(contentsOf: copy.candidatesForLargestSetWherePairsAreMultiple())
            }
        }
        
        return result
    }
    
    private func areAllPairsMultiple() -> Bool {
        
        for i in 0..<count-1 {
            for j in i..<count {
                if !(self[i] % self[j] == 0 || self[j] % self[i] == 0) {
                    return false
                }
            }
        }
        
        return true
    }
}
