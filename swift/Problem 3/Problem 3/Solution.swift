//
//  Solution.swift
//  Problem 3
//
//  Created by sebastien FOCK CHOW THO on 2019-06-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var val: String
    var left: Node? = nil
    var right: Node? = nil
    
    init(_ val: String, _ left: Node? = nil, _ right: Node? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    func serialize() -> String {
        return "\(self.val) \((self.left?.serialize() ?? "_")) \((self.right?.serialize() ?? "_")) "
    }
}

extension Array where Element == String {
    mutating func deserialize() -> Node? {
        if self.isEmpty {
            return nil
        }
        
        while self.count > 0 {
            let node = Node(self.removeFirst())
            node.left = deserialize()
            node.right = deserialize()
            
            return node
        }
        
        return nil
    }
}
