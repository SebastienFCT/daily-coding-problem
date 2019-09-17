//
//  Solution.swift
//  Problem 115
//
//  Created by sebastien FOCK CHOW THO on 2019-09-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: String
    var left: Node?
    var right: Node?
    
    init(value: String, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    convenience init(value: String) {
        self.init(value: value, left: nil, right: nil)
    }
    
    func includes(node: Node) -> Bool {
        if self == node {
            return true
        }
        
        if let left = left {
            if left.includes(node: node) {
                return true
            }
        }
        
        if let right = right {
            if right.includes(node: node) {
                return true
            }
        }
        
        return false
    }
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        if lhs.value != rhs.value {
            return false
        }
        
        if let lhsleft = lhs.left {
            guard let rhsleft = rhs.left else {
                return false
            }
            
            if lhsleft != rhsleft {
                return false
            }
        } else {
            if let _ = rhs.left {
                return false
            }
        }
        
        if let lhsright = lhs.right {
            guard let rhsright = rhs.right else {
                return false
            }
            
            if lhsright != rhsright {
                return false
            }
        } else {
            if let _ = rhs.right {
                return false
            }
        }
        
        return true
    }
}
