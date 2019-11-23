//
//  Solution.swift
//  Problem 182
//
//  Created by sebastien FOCK CHOW THO on 2019-11-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var children: [Node]
    
    init(value: Int, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    init(value: Int) {
        self.value = value
        self.children = []
    }
    
    func isMinimallyConnected() -> Bool {
        return !scanChildren(current: [self])
    }
    
    private func scanChildren(current: [Node]) -> Bool {
        var copy = current
        
        for child in children {
            if current.contains(where: { (element) -> Bool in
                element.value == child.value
            }) {
                return false
            }
            
            copy.append(child)
        }
        
        for child in children {
            if !child.scanChildren(current: copy) {
                return false
            }
        }
        
        return true
    }
}
