//
//  Solution.swift
//  Problem 254
//
//  Created by sebastien FOCK CHOW THO on 2020-02-03.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    func toBinaryTree() -> Node {
        
        let copy = self
        
        if let left = left, let right = right {
            copy.left = left.toBinaryTree()
            copy.right = right.toBinaryTree()
            
            return copy
        } else {
            if let left = left {
                return left.toBinaryTree()
            }
            
            if let right = right {
                return right.toBinaryTree()
            }
        }
        
        return copy
    }
}
