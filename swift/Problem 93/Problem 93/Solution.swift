//
//  Solution.swift
//  Problem 93
//
//  Created by sebastien FOCK CHOW THO on 2019-08-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    We assume that it's a tree with 2 children and integers as value
 
    A BST is a tree where each node on the right subtree is larger than the current node & each node on the left subtree is smaller than the current node
 
 */

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
}

extension Node {
    
    func largestBstSize() -> Int {
        
        if left == nil && right == nil {
            return 1
        }
        
        var currentCount = 1
        let leftCount = (left != nil ? left!.largestBstSize() : 0)
        let rightCount = (right != nil ? right!.largestBstSize() : 0)
        
        if left != nil {
            if left!.value > value {
                currentCount = 0
            } else {
                if right != nil {
                    if right!.value < value {
                        currentCount = 0
                    } else {
                        currentCount += left!.largestBstSize() + right!.largestBstSize()
                    }
                }
            }
        } else {
            if right != nil {
                if right!.value < value {
                    currentCount = 0
                } else {
                    currentCount += right!.largestBstSize()
                }
            }
        }
        
        return max(currentCount, leftCount, rightCount)
    }
}
