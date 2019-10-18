//
//  Solution.swift
//  Problem 146
//
//  Created by sebastien FOCK CHOW THO on 2019-10-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
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
    
    func prune() -> Node? {
        if let left = left {
            self.left = left.prune()
        }
        
        if let right = right {
            self.right = right.prune()
        }
        
        if left == nil && right == nil {
            if value == 0 {
                return nil
            }
            
            return self
        }
        
        return self
    }
}
