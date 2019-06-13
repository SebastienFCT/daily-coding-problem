//
//  Solution.swift
//  Problem 9
//
//  Created by sebastien FOCK CHOW THO on 2019-06-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func largestSumWithNonAdjacent() -> Int {
        var reversed = Array(self)
        reversed.reverse()
        
        return Swift.max(self.findLargestSumOfNonAdjacent(), reversed.findLargestSumOfNonAdjacent())
    }
    
    func findLargestSumOfNonAdjacent() -> Int {
        var copy = Array(self)
        
        if copy.count == 0 {
            return 0
        }
        
        if copy.count == 1 {
            return copy.first!
        }
        
        if copy.count == 2 {
            return Swift.max(copy.first!, copy.last!)
        }
        
        if copy[0] > copy[1] {
            return copy[0] + Array(copy[2...copy.count - 1]).findLargestSumOfNonAdjacent()
        } else {
            if copy.count > 3 {
                return copy[1] + Array(copy[3...copy.count - 1]).findLargestSumOfNonAdjacent()
            } else {
                return Swift.max(copy[1], copy[0] + copy[2])
            }
        }
    }
}
