//
//  Solution.swift
//  Problem 79
//
//  Created by sebastien FOCK CHOW THO on 2019-08-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    There are 2 things to implement here:
 
    - First we want a function that tells us if an array of integer is non-decreasing
    - Second we will create a function that loop through each element and check if removing them result in a non-decreasing array of integer
 
 */
extension Array where Element == Int {
    func isNonDecreasing() -> Bool {
        guard count > 1 else {
            // If it's empty or only has one element, then it's non-decreasing
            return true
        }
        
        var current = self[0] // there is no need to check against this value as we already know that the array is non empty
        
        for i in 1..<count {
            if self[i] < current {
                return false
            }
            
            current = self[i]
        }
        
        return true
    }
    
    func nonDecreasingByRemovingOneElement() -> (success: Bool, index: Int?) {
        if self.isNonDecreasing() {
            return (true, nil)
        }
        
        for i in 0..<count {
            var copy = self
            _ = copy.remove(at: i)
            
            if copy.isNonDecreasing() {
                return (true, i)
            }
        }
        
        return (false, nil)
    }
}
