//
//  Solution.swift
//  Problem 284
//
//  Created by sebastien FOCK CHOW THO on 2020-03-04.
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
    
    func nodesByLevel() -> [[Node]] {
    
        var result: [[Node]] = []
        
        var current: [Node] = []
        
        if let left = left {
            current.append(left)
        }
        
        if let right = right {
            current.append(right)
        }
        
        result.append(current)
        
        return result
    }
}

struct BinaryTree {
    
    var root: Node
    var nodesByLevel: [Int: [Node]]
    
    func cousin(of node: Node) -> [Node] {
        
        var result: [Node] = []
        var resultKey = 0
        
        // For simplicity we assume that nodes are unique in values
        for key in nodesByLevel.keys {
            if nodesByLevel[key]!.contains(where: { (aNode) -> Bool in
                aNode.value == node.value
            }) {
                result = nodesByLevel[key]!
                resultKey = key
                break
            }
        }
        
        var toRemove: Int? = nil
        
        if resultKey > 0 && result.count > 1 {
            for aNode in nodesByLevel[resultKey-1]! {
                if aNode.left?.value == node.value {
                    if let right = aNode.right {
                        toRemove = right.value
                        break
                    }
                }
                
                if aNode.right?.value == node.value {
                    if let left = aNode.left {
                        toRemove = left.value
                        break
                    }
                }
            }
        }
        
        if let toRemove = toRemove {
            for i in 0..<result.count {
                if result[i].value == toRemove {
                    result.remove(at: i)
                    break
                }
            }
        }
        
        for i in 0..<result.count {
            if result[i].value == node.value {
                result.remove(at: i)
                break
            }
        }
        
        return result
    }
    
    // New coding approach with a struct holding the binary tree and a function building the levels
    // After looking at the implementation it's not really easier to read and not worth it in terms of implementation since it does much more than just retrieving what it needs
    mutating func buildNodesByLevel() {
        nodesByLevel = [:]
        
        nodesByLevel[0] = [root]
        
        var currentLevel = 0
        
        while true {
            
            if !nodesByLevel.keys.contains(currentLevel) {
                return
            }
            
            if nodesByLevel[currentLevel]!.isEmpty {
                return
            }
            
            for node in nodesByLevel[currentLevel]! {
                
                if let left = node.left {
                    if !nodesByLevel.keys.contains(currentLevel+1) {
                        nodesByLevel[currentLevel+1] = [left]
                    } else {
                        nodesByLevel[currentLevel+1]!.append(left)
                    }
                }
                
                if let right = node.right {
                    if !nodesByLevel.keys.contains(currentLevel+1) {
                        nodesByLevel[currentLevel+1] = [right]
                    } else {
                        nodesByLevel[currentLevel+1]!.append(right)
                    }
                }
            }
            
            currentLevel += 1
        }
    }
}
