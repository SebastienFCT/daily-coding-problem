//
//  Solution.swift
//  Problem 307
//
//  Created by sebastien FOCK CHOW THO on 2020-03-27.
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
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

struct Tree {
    
    var root: Node
    
    func floorAndCeiling(value: Int) -> (floor: Node?, ceil: Node?) {
        
        let allValues = valuesByLevel()
        var floor: Node? = nil
        var ceil: Node? = nil
        
        for level in allValues {
            
            for node in level {
                if floor == nil {
                    if node.value <= value {
                        floor = node
                    }
                }
                
                if node.value >= value {
                    ceil = node
                }
            }
        }
        
        return (floor, ceil)
    }
    
    private func valuesByLevel() -> [[Node]] {
        
        var result: [[Node]] = [[root]]
        var currentIndex = 0
        
        while currentIndex <= result.count {
            
            var next: [Node] = []
            
            for node in result[currentIndex] {
                if let left = node.left {
                    next.append(left)
                }
                
                if let right = node.right {
                    next.append(right)
                }
            }
            
            if !next.isEmpty {
                result.append(next)
                currentIndex += 1
            } else {
                currentIndex += 2
            }
        }
        
        return result
    }
}
