//
//  Solution.swift
//  Problem 355
//
//  Created by sebastien FOCK CHOW THO on 2020-05-14.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Double {
    
    func roundedArrayWithSmallerPairwiseDiff() -> [Int] {
        
        var candidates = roundedArrayWithSmallerPairwiseDiff(current: [])
        for i in stride(from: candidates.count-1, through: 0, by: -1) {
            if candidates[i] == [] {
                candidates.remove(at: i)
            }
        }
        
        var index = 0
        var diff = Double(Int.max)
        
        for i in 0..<candidates.count {
            
            var newDiff: Double = 0
            
            for j in 0..<count {
                newDiff += (abs(Double(candidates[i][j]) - self[j]))
            }
            
            if newDiff < diff {
                diff = newDiff
                index = i
            }
        }
        
        return candidates[index]
    }
    
    private func roundedArrayWithSmallerPairwiseDiff(current: [Int]) -> [[Int]] {
        
        if current.count == count {
            
            let roundedOriginalSum = Int(self.reduce(0) { $0 + $1 }.rounded())
            let currentSum = current.reduce(0) { $0 + $1 }
            
            if roundedOriginalSum == currentSum {
                return [current]
            } else {
                return []
            }
        }
        
        var candidates: [[Int]] = []
        
        var candidate1 = current
        candidate1.append(Int(floor(self[current.count])))
        candidates.append(contentsOf: self.roundedArrayWithSmallerPairwiseDiff(current: candidate1))
        
        var candidate2 = current
        candidate2.append(Int(ceil(self[current.count])))
        candidates.append(contentsOf: self.roundedArrayWithSmallerPairwiseDiff(current: candidate2))
        
        return candidates
    }
}
