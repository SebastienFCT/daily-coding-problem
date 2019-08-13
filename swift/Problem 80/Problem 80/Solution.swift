//
//  Solution.swift
//  Problem 80
//
//  Created by sebastien FOCK CHOW THO on 2019-08-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    I'll first build my tree structure based on a node component that can have two node children
 
    I'll then write a function that builds a list of "full branches" (representing all the possible branches)
 
 */
class Node<T> {
    var value: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(value: T, left: Node<T>?, right: Node<T>?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    func findDeepestNode() -> (node: Node<T>, level: Int) {
        let possibilities = nextLevels(currentLevel: 0)
        
        // While force un-wrapping isn't recommended, it's enough for the demonstration as we know that we need the root to call the function from and it would return itself in the worst case
        return possibilities.sorted{ $0.level > $1.level }.first!
    }
    
    // Recursive function that keep tracks of the current level of the node
    private func nextLevels(currentLevel: Int) -> [(node: Node<T>, level: Int)] {
        var result: [(node: Node<T>, level: Int)] = []
        
        // If there are no children, this is the maximum level (for this branch)
        if left == nil && right == nil {
            result.append((node: self, level: currentLevel))
            return result
        }
        
        // Otherwise, ask the children if there are other levels
        if let left = left {
            result.append(contentsOf: left.nextLevels(currentLevel: currentLevel+1))
        }
        
        if let right = right {
            result.append(contentsOf: right.nextLevels(currentLevel: currentLevel+1))
        }
        
        return result
    }
}
