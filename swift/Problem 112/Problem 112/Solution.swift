//
//  Solution.swift
//  Problem 112
//
//  Created by sebastien FOCK CHOW THO on 2019-09-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/*
 * For simplicity, we will identify the node by its integer value
 */
class Node {
    var value: Int
    var left: Node?
    var right: Node?
    var parent: Node?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
        self.parent = nil
    }
    
    func setLeftChild(node: Node?) {
        if let left = left {
            left.parent = nil
        }
        
        self.left = node
        
        node?.parent = self
    }
    
    func setRightChild(node: Node?) {
        if let right = right {
            right.parent = nil
        }
        
        self.right = node
        
        node?.parent = self
    }
}

// MARK: - Utilities

extension Node {
    func parents(base: [Node]) -> [Node] {
        if let parent = parent {
            return parent.parents(base: base + [self])
        }
        
        return base + [self]
    }
    
    func lca(with node: Node) -> Node? {
        let leftParents = self.parents(base: [])
        let rightParents = node.parents(base: [])
        
        for i in 0..<max(leftParents.count, rightParents.count) {
            if i <= leftParents.count {
                let current = leftParents[i]
                if rightParents.contains(where: { (aNode) -> Bool in
                    return aNode.value == current.value
                }) {
                    return current
                }
            }
            
            if i <= rightParents.count {
                let current = rightParents[i]
                if leftParents.contains(where: { (aNode) -> Bool in
                    return aNode.value == current.value
                }) {
                    return current
                }
            }
        }
        
        return nil
    }
}
