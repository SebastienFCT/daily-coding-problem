//
//  Solution.swift
//  Problem 37
//
//  Created by sebastien FOCK CHOW THO on 2019-07-01.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    According to the example, we build a power set by creating a array of set and appending
 
    - First all possible combination of 1 item
    - All possible combination of 2 items
    - ...
    - All possible combinatino of N-1 items, N being the size of the original set
    - The set itself
 
    EDIT: after testing it out, I spent about an hour trying to apply the previous logic, I got stuck in my thoughts and tried a different approach:
 
    - Create a power set variable (an array of set)
    - Remove an element of the initial set and add it as a "set" in the power set variable, then loop
    - For each of the next element, add a combination of each element in the power set variable with themselve and finally add themselves as their own "set"
    - The end condition is when the initial set is empty
 
 */
extension Set where Element == Int {
    // Powerset is a convenient methods that has an explicit name for the client. We could have used a single function instead.
    mutating func powerSet() -> [Set<Int>] {
        return self.allCombination(result: [])
    }
    
    mutating func allCombination(result: [Set<Int>]) -> [Set<Int>] {
        var result: [Set<Int>] = result
        
        // I get the first element of the set
        let next = self.removeFirst()
        
        // If the current result is empty, I add the first element to it and re-iterate, this prevents from having a first duplicate case
        if result.isEmpty {
            result.append(Set([next]))
            return self.allCombination(result: result)
        }
        
        // For each element in the current result, I create a combination of the element with my `next` value. I store them in a temporary array of set to avoid concurrent modification of the original variable
        var toAppend: [Set<Int>] = []
        
        for element in result {
            var copy = element
            copy.insert(next)
            toAppend.append(copy)
        }
        
        result.append(contentsOf: toAppend)
        // Don't forget to add the value itself
        result.append(Set([next]))
        
        // If you still have value in the set, keep running, otherwise return the result
        if !self.isEmpty {
            return self.allCombination(result: result)
        }
        
        return result
    }
}
