//
//  Solution.swift
//  Problem 73
//
//  Created by sebastien FOCK CHOW THO on 2019-08-06.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    First, let's define a linked list
 
 */

class Node {
    var value: String
    var next: Node?
    
    init(value: String, next: Node?) {
        self.value = value
        self.next = next
    }
}

struct LinkedList {
    var head: Node?
}

/**
 
    A -> B -> C -> D has to become D -> C -> B -> A
 
    We can store each node in an array, it would give us [A, B, C, D, A], reverse the array and rebuild the linked list
 
 */
extension LinkedList {
    mutating func reverse() {
        if let linkedListHead = head {
            var orderedNodes: [Node] = linkedListHead.getList(current: [])
            
            var newHead: Node? = nil
            var current: Node? = nil
            
            for i in stride(from: orderedNodes.count-1, through: 0, by: -1) {
                
                if newHead == nil {
                    newHead = orderedNodes[i]
                    current = orderedNodes[i]
                } else {
                    current?.next = orderedNodes[i]
                    current = current?.next
                    
                    // End conidtion, make sure to avoid the loop
                    if i == 0 {
                        current?.next = nil
                    }
                }
            }
            
            head = newHead
        }
    }
}

extension Node {
    func getList(current: [Node]) -> [Node] {
        
        if let next = next {
            return next.getList(current: current + [self])
        }
        
        return current + [self]
    }
}
/**
 
    Utility class to visually display the linked list
 
 */
extension LinkedList {
    func log() {
        if let head = head {
            var result: [String] = []
            
            for node in head.getList(current: []) {
                result.append(node.value)
            }
            
            print(result)
        }
    }
}
