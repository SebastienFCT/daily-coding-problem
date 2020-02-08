//
//  Solution.swift
//  Problem 258
//
//  Created by sebastien FOCK CHOW THO on 2020-02-07.
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
    
    init(value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    func boustrophedon() -> [Int] {
        
        var result: [Int] = []
        
        var nodes: [[Node]] = [[self]]
        var index = 0
        
        var next: [Node] = []
        if let left = left {
            next.append(left)
        }
        
        if let right = right {
            next.append(right)
        }
        
        if !next.isEmpty {
            nodes.append(next)
        }
        
        while index < nodes.count-1 {
            index += 1
            
            let current = nodes[index]
            var new: [Node] = []
            
            for node in current {
                if let left = node.left {
                    new.append(left)
                }
                
                if let right = node.right {
                    new.append(right)
                }
            }
            
            if !new.isEmpty {
                nodes.append(new)
            }
        }
        
        let mapped = nodes.map{ $0.map{ $0.value } }
        
        for i in 0..<mapped.count {
            if i % 2 == 0 {
                result.append(contentsOf: mapped[i])
            } else {
                result.append(contentsOf: mapped[i].reversed())
            }
        }
        
        return result
    }
}
