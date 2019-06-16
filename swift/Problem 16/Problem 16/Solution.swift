//
//  Solutions.swift
//  Problem 16
//
//  Created by sebastien FOCK CHOW THO on 2019-06-15.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var id: String
    var previous: Node?
    var next: Node?
    
    init(id: String) {
        self.id = id
        self.previous = nil
        self.next = nil
    }
}

struct Env {
    var head: Node? = nil
    var last: Node? = nil
    
    mutating func record(id: String) {
        let node = Node(id: id)
        
        if head == nil {
            head = node
            return
        }
        
        if last == nil {
            last = node
            last!.next = head
            last!.previous = head
            head!.next = last
            head!.previous = last
            return
        }
        
        if let last = last {
            node.previous = last
            node.next = head!
            
            last.next = node
            head!.previous = node
        }
        
        last = node
    }
    
    func getLast(i: Int) -> Node? {
        if head == nil {
            return nil
        }
        
        if last == nil {
            return head
        }

        var target: Node = head!
        
        for _ in 0...(i-1) {
            guard let previous = target.previous else {
                return nil
            }
            
            // We're assuming ids are unique
            if previous.id != head!.id {
                target = previous
            } else {
                return nil
            }
        }
        
        return target
    }
}
