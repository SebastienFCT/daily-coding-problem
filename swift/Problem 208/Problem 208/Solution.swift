//
//  Solution.swift
//  Problem 208
//
//  Created by sebastien FOCK CHOW THO on 2019-12-19.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node) {
        self.value = value
        self.next = next
    }
    
    init(value: Int) {
        self.value = value
        self.next = nil
    }
    
    func partition(by k: Int) -> Node? {
        var root = self
        var current: Node? = root
        
        while current?.next != nil {
            let next = current!.next!
            
            if next.value < k {
                current!.next = next.next
                next.next = root
                root = next
            }
            
            current = current!.next
        }
        
        return root
    }
    
    func printList() -> String {
        
        var result = ""
        
        var current: Node? = self
        
        while current != nil {
            if !result.isEmpty {
                result += "->"
            }
            
            result += "\(current!.value)"
            current = current!.next
        }
        
        return result
    }
}
