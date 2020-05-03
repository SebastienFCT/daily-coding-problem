//
//  Solution.swift
//  Problem 344
//
//  Created by sebastien FOCK CHOW THO on 2020-05-03.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var children: [Node]
    
    init(value: Int, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    func countNodes() -> Int {
        
        return 1 + children.map({ $0.countNodes() }).reduce(0) { $0 + $1 }
    }
    
    func maxEdgeCutWithEvenSubtrees() -> Int {
        
        var result = 0
        
        for child in children {
            if child.countNodes() % 2 == 0 {
                result += 1
            }
            
            result += child.maxEdgeCutWithEvenSubtrees()
        }
        
        return result
    }
}
