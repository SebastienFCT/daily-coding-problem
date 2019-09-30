//
//  Solution.swift
//  Problem 36
//
//  Created by sebastien FOCK CHOW THO on 2019-06-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: String
    var left: Node? = nil
    var right: Node? = nil
    
    init(value: String, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
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
