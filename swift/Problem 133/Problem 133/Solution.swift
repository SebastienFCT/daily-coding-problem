//
//  Solution.swift
//  Problem 133
//
//  Created by sebastien FOCK CHOW THO on 2019-10-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var parent: Node?
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
        self.parent = nil
        self.left = nil
        self.right = nil
    }
    
    init(value: Int, parent: Node?, left: Node?, right: Node?) {
        self.value = value
        self.parent = parent
        self.left = left
        self.right = right
    }
    
    func inOrderSuccessor() -> Node? {
        
        var candidates: [Node] = []
        
        candidates.append(contentsOf: children())
        candidates.append(contentsOf: parents())
        
        let filteredAndSorted = candidates.filter{ $0.value > self.value }.sorted{ $0.value < $1.value }
        
        return filteredAndSorted.first
    }
    
    private func children() -> [Node] {
        var result: [Node] = []
        
        if let left = left {
            result.append(left)
            result.append(contentsOf: left.children())
        }
        
        if let right = right {
            result.append(right)
            result.append(contentsOf: right.children())
        }
        
        return result
    }
    
    private func parents() -> [Node] {
        var result: [Node] = []
        
        if let parent = parent {
            result.append(parent)
            result.append(contentsOf: parent.parents())
        }
        
        return result
    }
}
