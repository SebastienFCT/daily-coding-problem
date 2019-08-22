//
//  Solution.swift
//  Problem 89
//
//  Created by sebastien FOCK CHOW THO on 2019-08-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    func isValidBinaryTree() -> Bool {
        if let left = left {
            if left.value > value {
                return false
            }
        }
        
        if let right = right {
            if right.value < value {
                return false
            }
        }
        
        if left == nil && right == nil {
            return true
        }
        
        if left != nil && right != nil {
            return left!.isValidBinaryTree() && right!.isValidBinaryTree()
        }
        
        if left != nil {
            return left!.isValidBinaryTree()
        }
        
        if right != nil {
            return right!.isValidBinaryTree()
        }
        
        return true
    }
}
