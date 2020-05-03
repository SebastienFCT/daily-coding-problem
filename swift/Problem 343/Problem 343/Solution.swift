//
//  Solution.swift
//  Problem 343
//
//  Created by sebastien FOCK CHOW THO on 2020-05-03.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
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
    
    func sum(forRange range: ClosedRange<Int>) -> Int {
        
        if range.contains(value) {
            return value + (left?.sum(forRange: range) ?? 0) + (right?.sum(forRange: range) ?? 0)
        }
        
        if value > range.max()! {
            return left?.sum(forRange: range) ?? 0
        }
        
        if value < range.min()! {
            return right?.sum(forRange: range) ?? 0
        }
        
        return 0
    }
}
