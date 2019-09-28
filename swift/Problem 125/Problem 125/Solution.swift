//
//  Solution.swift
//  Problem 125
//
//  Created by sebastien FOCK CHOW THO on 2019-09-27.
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
    
    func paidForSum(_ sum: Int) -> [Node]? {
        
        let nodes = allNodes()
        
        for i in 0..<nodes.count {
            let current = nodes[i]
            
            for j in i+1..<nodes.count {
                let other = nodes[j]
                
                if current.value + other.value == sum {
                    return [current, other]
                }
            }
        }
        
        return nil
    }
    
    func allNodes() -> [Node] {
        
        var result: [Node] = []
        result.append(self)
        
        if let left = left {
            result.append(contentsOf: left.allNodes())
        }
        
        if let right = right {
            result.append(contentsOf: right.allNodes())
        }
        
        return result
    }
}
