//
//  Solution.swift
//  Problem 237
//
//  Created by sebastien FOCK CHOW THO on 2020-01-17.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var children: [Node]
    
    init(value: Int) {
        self.value = value
        self.children = []
    }
    
    func orderedNodesPerLevel() -> [[Node]] {
        
        var result: [[Node]] = []
        
        var current = [self]
        
        while !current.isEmpty {
            result.append(current)
            
            var newRow: [Node] = []
            
            for node in current {
                newRow.append(contentsOf: node.children)
            }
            
            current = newRow
        }
        
        return result
    }
    
    func isSymmetric() -> Bool {
        
        let levels = orderedNodesPerLevel()
        for level in levels {
            let map = level.map{ $0.value }
            if !map.isSymetric() {
                return false
            }
        }
        
        return true
    }
}

extension Array where Element == Int {
    
    func isSymetric() -> Bool {
        for i in 0...count/2 {
            if self[i] != self[count-i-1] {
                return false
            }
        }
        
        return true
    }
}
