//
//  Solution.swift
//  Problem 4
//
//  Created by sebastien FOCK CHOW THO on 2019-06-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    To solve this problem, I would
 
    1. Loop through positive integers 0, 1, 2, ...
    2. For each element, check if the array
 
 */

extension Array where Element == Int {
    func lowerMissingPositiveInteger() -> Int {
        var index = 1
        
        while (true) {
            if !self.contains(index) {
                return index
            }
            
            index += 1
        }
    }
}

/**
 
    Now this is expensive as each loop is actually scanning the array
 
    Another approach might be looping through the elements of the array itself.
 
    1. First let's remove negative element and sort the array
    2. Then we loop through the array and make sure that each value is equal to its previous value + 1 otherwise that means that we found the lowest missing integer
 
 */

extension Array where Element == Int {
    func lowerMissingPositiveInteger2() -> Int {
        let sortedAndPositive = self.sorted{ $0 < $1}.filter{ $0 > 0 }
        
        var lastValue = 0
        
        for element in sortedAndPositive {
            if element != lastValue + 1 {
                return lastValue + 1
            }
            
            lastValue += 1
        }
        
        return lastValue + 1
    }
}
