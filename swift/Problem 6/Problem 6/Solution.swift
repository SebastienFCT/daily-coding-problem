//
//  Solution.swift
//  Problem 6
//
//  Created by sebastien FOCK CHOW THO on 2019-06-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

// This won't compile, the logic is well explained at: https://www.techiedelight.com/xor-linked-list-overview-implementation-c-cpp/

class Node {
    var data: String
    var link: UnsafeMutablePointer<Node>? = nil
    
    init(data: String) {
        self.data = data
        self.link = UnsafeMutablePointer<Node>(&self)
    }
    
    func traverse(head: Node) {
        var current: Node? = head
        var prev: Node? = nil
        var next: Node? = nil
        
        while current != nil {
            next = xor(a: prev, b: current)
            prev = current
            current = next
        }
    }
    
    func insert(head: Node, data: String) {
        var node = Node(data: data)
        node.link = xor(a: head, b: nil)
        
        if (head != nil) {
            head.link = xor(a: node, b: xor(a: head.link, b: nil))
        }
    }
    
    // MARK: - Utility
    
    func xor(a: Node?, b: Node?) -> Node {
        let xor = UnsafeMutablePointer<Node>(&a) ^ UnsafeMutablePointer<Node>(&b)
        let node = UnsafeMutablePointer<Node>.allocate(capacity: 8)
        
        return node.pointee
    }
}
