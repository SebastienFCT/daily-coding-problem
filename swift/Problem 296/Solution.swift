//
//  Solution.swift
//  Problem 296
//
//  Created by sebastien FOCK CHOW THO on 2020-03-16.
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
    
    func toString() -> String {
        
        var result = "\(value)"
        
        if let left = left {
            result = "\(result) -> \(left.toString())"
        }
        
        if let right = right {
            result = "\(result) -> \(right.toString())"
        }
        
        return result
    }
}

extension Array where Element == Int {
    
    func heightBalancedBinaryTree() -> Node {
        
        if count == 1 {
            return Node(value: self.first!)
        }
        
        if count == 2 {
            return Node(value: last!, left: Node(value: first!), right: nil)
        }
        
        let sorted = self.sorted{ $0 < $1 }
        
        let center = sorted[sorted.count / 2]
        let node = Node(value: center)
        
        if count % 2 == 0 {
            node.left = Array(prefix((sorted.count / 2) - 1)).heightBalancedBinaryTree()
            node.right = Array(suffix((sorted.count / 2) - 1)).heightBalancedBinaryTree()
        } else {
            node.left = Array(prefix((sorted.count / 2))).heightBalancedBinaryTree()
            node.right = Array(suffix((sorted.count / 2))).heightBalancedBinaryTree()
        }
        
        return node
    }
}
