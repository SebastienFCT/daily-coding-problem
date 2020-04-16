//
//  Solution.swift
//  Problem 326
//
//  Created by sebastien FOCK CHOW THO on 2020-04-15.
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
}


extension Array where Element == Int {
    
    func toTree(next: Node?) -> Node? {
        
        if isEmpty {
            return next
        }
        
        guard let last = next else {
            return Array(suffix(count-1)).toTree(next: Node(value: self[0]))
        }
        
        let node = Node(value: self[0])
        
        if last.value > node.value {
            node.left = last
            return Array(suffix(count-1)).toTree(next: node)
        }
        
        last.right = node
        return Array(suffix(count-1)).toTree(next: last)
    }
}
