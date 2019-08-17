//
//  Solution.swift
//  Problem 83
//
//  Created by sebastien FOCK CHOW THO on 2019-08-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    In swift this is straight forward:
 
    - We create a node structure base of the tree
    - We create a reverse function that reverse both children, the trick is to properly handly single children or no children
 
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
    
    func reverseChildren() {
        if let left = left, let right = right {
            self.left = right
            self.right = left
            
            self.left?.reverseChildren()
            self.right?.reverseChildren()
            
            return
        }
        
        if let right = right {
            self.left = right
            self.right = nil
            
            self.left?.reverseChildren()
            
            return
        }
        
        if let left = left {
            self.right = left
            self.left = nil
            
            return
        }
    }
}

