//
//  Solution.swift
//  Problem 60
//
//  Created by sebastien FOCK CHOW THO on 2019-07-24.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    In this problem, we're trying to find a combination of element of set for which the sum is equal of the sum of the rest.
 
    I don't know how manage multisets in swift (not sure if it exists) so I'll use arrays
 
    It's like picking a random element until we either:
 
    - Reach a value that correspond to the sum of the rest (in which case we return true)
    - Reach a value that is greater than the sum of the rest (in which case we return false)
 
    The order in which we pick the element counts
 
    To build such an algorithm, we can try to use a tree, each node correspond to the new picked element
 
 */
class Node {
    var value: Int
    var previousElements: [Int]
    var remainingElements: [Int]
    
    init(value: Int, previousElements: [Int], remainingElements: [Int]) {
        self.value = value
        self.previousElements = previousElements
        self.remainingElements = remainingElements
    }
}
/**
 
    We need to create a root for our tree, and right a recursive function that finds a path (branches) where the sum of the remaining elements is equal to the sum of the previous values
 
 */
extension Node {
    func coupleWithCommonSum() -> (left: [Int], right: [Int])? {
        let reducedPrevious = previousElements.reduce(0, +)
        let reducedRemaining = remainingElements.reduce(0, +)
        
        // Win condition
        if reducedPrevious == reducedRemaining {
            return (previousElements, remainingElements)
        }
        
        // Loose condition
        if reducedPrevious > reducedRemaining {
            return nil
        }
        
        var index = 0
        for element in remainingElements {
            let newPrevious = previousElements + [element]
            var newRemaining = remainingElements
            newRemaining.remove(at: index)
            
            let newNode = Node(value: element, previousElements: newPrevious, remainingElements: newRemaining)
            if let solution = newNode.coupleWithCommonSum() {
                return solution
            }
            
            index += 1
        }
        
        // We tried all combinations and none worked
        return nil
    }
}
/**
 
    Finally, we need to try this algorithm again each possible root of the tree
 
 */
extension Array where Element == Int {
    func findCoupleSetWithCommonSum() -> (left: [Int], right: [Int])? {
        
        var index = 0
        for element in self {
            let previous = [element]
            var remaining = self
            remaining.remove(at: index)
            
            let root = Node(value: element, previousElements: previous, remainingElements: remaining)
            if let solution = root.coupleWithCommonSum() {
                return solution
            }
            
            index += 1
        }
        
        return nil
    }
}
