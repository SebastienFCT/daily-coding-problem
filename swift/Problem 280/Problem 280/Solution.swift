//
//  Solution.swift
//  Problem 280
//
//  Created by sebastien FOCK CHOW THO on 2020-02-29.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var nodes: [Node]
    
    init(value: Int, nodes: [Node]) {
        self.value = value
        self.nodes = nodes
    }
    
    init(value: Int) {
        self.value = value
        self.nodes = []
    }
    
    func containsCycle(current: [Node]) -> Bool {
        
        var result = current
        
        if result.contains(where: { (aNode) -> Bool in
            aNode.value == value
        }) {
            return true
        } else {
            result.append(self)
        }
        
        for node in nodes {
            
            if node.containsCycle(current: result) {
                return true
            }
        }
        
        return false
    }
}
