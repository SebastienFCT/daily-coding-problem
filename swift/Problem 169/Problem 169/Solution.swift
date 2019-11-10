//
//  Solution.swift
//  Problem 169
//
//  Created by sebastien FOCK CHOW THO on 2019-11-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
    
    func toArray() -> [Int] {
        var result: [Int] = []
        result.append(value)
        
        if let next = next {
            result.append(contentsOf: next.toArray())
        }
        
        return result
    }
    
    func sort() -> Node? {
        let sortedValues = toArray().sorted()
        
        var head: Node?
        var next: Node?
        
        for value in sortedValues {
            if head == nil {
                head = Node(value: value, next: nil)
            } else {
                if next == nil {
                    next = Node(value: value, next: nil)
                    head!.next = next
                } else {
                    next!.next = Node(value: value, next: nil)
                    next = next!.next
                }
            }
        }
        
        return head
    }
    
    func printList() -> String {
        var result = ""
        
        result += "\(value)"
        
        if let next = next {
            result += "->\(next.printList())"
        }
        
        return result
    }
}
