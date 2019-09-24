//
//  Solution.swift
//  Problem 26
//
//  Created by sebastien FOCK CHOW THO on 2019-06-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Node {
    
    func removeElementAt(_ index: Int) {
        var currentNode = self
        
        for _ in 0...index-2 {
            if let child = currentNode.node {
                currentNode = child
            } else {
                fatalError("index cannot be greater than the length of your list")
            }
        }
        
        guard let childNode = currentNode.node else  {
            fatalError("index cannot be greater than the length of your list")
        }
        
        if let grandChildNode = childNode.node {
            // if k < list length
            currentNode.node = grandChildNode
        } else {
            // if k == list length
            currentNode.node = nil
        }
    }
}

class Node {
    var value: String
    var node: Node?
    
    init(value: String) {
        self.value = value
        self.node = nil
    }
    
    init(value: String, node: Node?) {
        self.value = value
        self.node = node
    }
    
    func getElementAt(_ index: Int) -> Node {
        var currentNode = self
        
        for _ in 0...index-1 {
            if let child = currentNode.node {
                currentNode = child
            } else {
                fatalError("index cannot be greater than the length of your list")
            }
        }
        
        return currentNode
    }
}
