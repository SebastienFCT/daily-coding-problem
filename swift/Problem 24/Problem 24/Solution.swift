//
//  Solution.swift
//  Problem 24
//
//  Created by sebastien FOCK CHOW THO on 2019-06-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var parent: Node?
    var left: Node?
    var right: Node?
    var is_locked: Bool = false
    
    init(parent: Node?) {
        self.parent = parent
        self.left = nil
        self.right = nil
    }
    
    func isLoackableOrUnloackable() -> Bool {
        if anyParentLocked() {
            return false
        }
        
        if anyChildLocked() {
            return false
        }
        
        return true
    }
    
    func anyParentLocked() -> Bool {
        if let parent = parent {
            if parent.is_locked || parent.anyParentLocked() {
                return true
            }
        }
        
        return false
    }
    
    func anyChildLocked() -> Bool {
        if let left = left {
            if left.is_locked || left.anyChildLocked() {
                return true
            }
        }
        
        if let right = right {
            if right.is_locked || right.anyChildLocked() {
                return true
            }
        }
        
        return false
    }
    
    func lock() -> Bool {
        if isLoackableOrUnloackable() {
            is_locked = true
            return true
        }
        
        return false
    }
    
    func unlock() -> Bool {
        if isLoackableOrUnloackable() {
            is_locked = false
            return true
        }
        
        return false
    }
}
