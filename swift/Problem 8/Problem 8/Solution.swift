//
//  Solution.swift
//  Problem 8
//
//  Created by sebastien FOCK CHOW THO on 2019-06-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var val: Int
    var left: Node?
    var right: Node?
    
    init(val: Int, left: Node? = nil, right: Node? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    func isUnival(val: Int? = nil) -> Bool {
        if let val = val {
            if self.val != val {
                return false
            }
        }
        
        if left == nil && right == nil {
            return true
        } else {
            if let left = left, let right = right {
                return left.isUnival(val: self.val) && right.isUnival(val: self.val)
            }
            
            if left == nil {
                return right!.val == self.val
            }
            
            if right == nil {
                return left!.val == self.val
            }
        }
        
        return true
    }
    
    func countUnival() -> Int {
        return (isUnival() ? 1 : 0) + (left?.countUnival() ?? 0) + (right?.countUnival() ?? 0)
    }
}
