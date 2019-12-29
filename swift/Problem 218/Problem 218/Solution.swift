//
//  Solution.swift
//  Problem 218
//
//  Created by sebastien FOCK CHOW THO on 2019-12-29.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: String
    var next: Node?
    
    init(value: String) {
        self.value = value
        self.next = nil
    }
    
    init(value: String, next: Node?) {
        self.value = value
        self.next = next
    }
    
    func reverse() -> Node {
        
        var current: Node? = self
        var nodes: [Node] = [current!]
        
        while current!.next != nil {
            nodes.append(current!.next!)
            current = current!.next
        }
        
        var root: Node? = nil
        var node: Node? = nil
        
        nodes.reversed().forEach { (item) in
            if root == nil {
                root = item
                node = item
            } else {
                node!.next = item
                node = node!.next
            }
        }
        
        node?.next = nil
        
        return root!
    }
    
    var view: String {
        var current: Node? = self
        var result = "\(current!.value)"
        
        while current?.next != nil {
            result += "->\(current!.next!.value)"
            current = current!.next
        }
        
        return result
    }
}
