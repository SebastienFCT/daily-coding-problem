//
//  Solution.swift
//  Problem 37
//
//  Created by sebastien FOCK CHOW THO on 2019-07-01.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Set where Element == Int {
    
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
