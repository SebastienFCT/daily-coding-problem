//
//  Solution.swift
//  Problem 278
//
//  Created by sebastien FOCK CHOW THO on 2020-02-27.
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
    
    func printable() -> String {
        
        var result = "\(value)"
        
        if let left = left {
            result += "\(left.printable())"
        }
        
        if let right = right {
            result += "\(right.printable())"
        }
        
        return result
    }
}

struct BinarySearchTree {
    
    func allTrees(n: Int) -> [Node] {
        
        return allTrees(min: 1, max: n)
    }
    
    func allTrees(min: Int, max: Int) -> [Node] {
        
        var result: [Node] = []
        
        if min == max {
            return [Node(value: min)]
        }
        
        for i in min...max {
            
            if i == min {
                
                for rightTree in allTrees(min: min+1, max: max) {
                    
                    let root = Node(value: i)
                    root.right = rightTree
                    result.append(root)
                }
                
            } else if (i > min && i < max) {
                
                for leftTree in allTrees(min: min, max: i-1) {
                    
                    for rightTree in allTrees(min: i+1, max: max) {
                        
                        let root = Node(value: i)
                        root.left = leftTree
                        root.right = rightTree
                        result.append(root)
                    }
                }
                
            } else {
                
                for leftTree in allTrees(min: min, max: max-1) {
                    
                    let root = Node(value: i)
                    root.left = leftTree
                    result.append(root)
                }
            }
        }
        
        return result
    }
}
