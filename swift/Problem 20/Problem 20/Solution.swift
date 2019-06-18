//
//  Solution.swift
//  Problem 20
//
//  Created by sebastien FOCK CHOW THO on 2019-06-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node: Equatable, Comparable, Hashable {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
    
    // We assume that the same value means the same node
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.value < rhs.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }
}

func commonNode(lhs: Node, rhs: Node) -> Node? {
    var set = Set<Node>()
    
    var currentNode: Node? = nil
    currentNode = lhs
    
    while currentNode != nil {
        if set.insert(currentNode!).inserted {
            currentNode = currentNode!.next
        }
    }
    
    currentNode = rhs
    
    while currentNode != nil {
        if set.insert(currentNode!).inserted {
            currentNode = currentNode!.next
        } else {
            return currentNode!
        }
    }
    
    return nil
}
