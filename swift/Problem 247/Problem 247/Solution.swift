//
//  Solution.swift
//  Problem 247
//
//  Created by sebastien FOCK CHOW THO on 2020-01-27.
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
    
    func height() -> Int {
        
        var leftH = 1
        var rightH = 1
        
        if let left = left {
            leftH += left.height()
        }
        
        if let right = right {
            rightH += right.height()
        }
        
        return max(leftH, rightH)
    }
    
    func isHeightBalanced() -> Bool {
        
        var leftH = 0
        var rightH = 0
        
        if let left = left {
            if !left.isHeightBalanced() {
                return false
            }
            
            leftH = left.height()
        }
        
        if let right = right {
            if !right.isHeightBalanced() {
                return false
            }
            
            rightH = right.height()
        }
        
        return abs(leftH-rightH) <= 1
    }
}
