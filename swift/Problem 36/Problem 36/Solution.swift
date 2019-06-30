//
//  Solution.swift
//  Problem 36
//
//  Created by sebastien FOCK CHOW THO on 2019-06-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    First, we should setup classes that handle our binary tree.
 
    Let's create a node class that has a value (that will be used for the tests essentially), a reference to a first child and a reference to a second child
 
 */
class Node {
    var value: String
    var left: Node? = nil
    var right: Node? = nil
    
    init(value: String, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
}
/**
 
    Ok so now we need to setup an algorithm that determines the maximum length of a tree.
 
    The maximum legnth is defined by how many children it has at most.
 
    The function must be recursive. If the current node has at least one child, then it returns 1 + the maximum length of the child/children.
 
 */
extension Node {
    func maxLengh() -> Int {
        
        if let left = left, let right = right {
            return 1 + max(left.maxLengh(), right.maxLengh())
        }
        
        if let left = left {
            return 1 + left.maxLengh()
        }
        
        if let right = right {
            return 1 + right.maxLengh()
        }
        
        return 0
    }
}
/**
 
    Finally, we just have to get call this function for the children of the root
 
 */
extension Node {
    func nextLargestNode() -> Node? {
        if let left = left, let right = right {
            let leftSize = left.maxLengh()
            let rightSize = right.maxLengh()
            
            return leftSize > rightSize ? left : right
        }
        
        if let left = left {
            return left
        }
        
        if let right = right {
            return right
        }
        
        return nil
    }
}
