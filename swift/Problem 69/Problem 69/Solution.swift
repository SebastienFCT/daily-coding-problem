//
//  Solution.swift
//  Problem 69
//
//  Created by sebastien FOCK CHOW THO on 2019-08-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    The example shows clearly the challenge: negative values can be used when their product result in a positive value
 
    To solve this problem, I would order the array descendently by absolute values and I would try to figure out an algorithm that find the 3 largest values with either 2 of them being negative or none of them
 
    - Let's imagine that my sorted array is [9,8,7,6,...], the result is obvious, it's the first 3 elements
    - Now if I have [-10,-9,8,7,6,....], then I still grab the 3 first elements
    - The real problem is when I have something like [-10,9,8,-7,6], for this one I have to figure out if -10 * -7 * 9 is greater than 9 * 8 * 6
 
    Let's try to create two utility functions that do the following:
 
    - The first one find the largest trio with 2 negative values
    - The second one find the largest trio with no negative values
    - After this I only have to return the maximum between the two
 
 */
extension Array where Element == Int {
    func winningTrio() -> Int {
        let sorted = self.sorted{ abs($0) > abs($1) }
        
        let maxWithoutNegative = sorted.findLargestWithoutNegative().reduce(1, *)
        let maxWithPairOfNegatives = sorted.findLargestWithPairOfNegative().reduce(1, *)
        
        return Swift.max(maxWithoutNegative, maxWithPairOfNegatives)
    }
    
    // These functions only works if the array is pre-sorted
    internal func findLargestWithoutNegative() -> [Int] {
        let positiveValues = self.filter{ $0 >= 0 }
        
        // If we have less than 3 positive values, then we return 0
        guard positiveValues.count >= 3 else {
            return []
        }
        
        return Array(positiveValues.prefix(3))
    }
    
    internal func findLargestWithPairOfNegative() -> [Int] {
        var result: [Int] = []
        
        var countPositive = 0
        var countNegative = 0
        
        for value in self {
            // Early loop breaker
            if countNegative == 2 && countPositive == 1 {
                return result
            }
            
            if value >= 0 {
                if countPositive == 1 {
                    continue
                } else {
                    result.append(value)
                    countPositive += 1
                }
            } else {
                if countNegative == 2 {
                    continue
                } else {
                    result.append(value)
                    countNegative += 1
                }
            }
        }
        
        return result
    }
}
