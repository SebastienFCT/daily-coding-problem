//
//  Solution.swift
//  Problem 104
//
//  Created by sebastien FOCK CHOW THO on 2019-09-06.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var previous: Node?
    var next: Node?
    
    init(value: Int, previous: Node?, next: Node?) {
        self.value = value
        self.previous = previous
        self.next = next
    }
}

struct LinkedList {
    var root: Node?
    
    mutating func push(node: Node) {
        if let root = root {
            if let previous = root.previous {
                previous.next = node
                node.previous = previous
            } else {
                root.next = node
                node.previous = root
            }
        } else {
            root = node
        }
    }
    
    func isPalindrome() -> Bool {
        
        var entries: [Int] = []
        
        if var current = root {
            entries.append(current.value)
            
            while current.next != nil {
                current = current.next!
                entries.append(current.value)
            }
        }
        
        if entries.count % 2 == 0 {
            return Array(entries.prefix(entries.count/2)) == Array(entries.suffix(entries.count/2)).reversed()
        } else {
            return Array(entries.prefix(entries.count/2-1)) == Array(entries.suffix(entries.count/2-1).reversed())
        }
    }
}
