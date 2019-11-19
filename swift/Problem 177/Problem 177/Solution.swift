//
//  Solution.swift
//  Problem 177
//
//  Created by sebastien FOCK CHOW THO on 2019-11-18.
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
    
    func rotate(by: Int) -> Node {
     
        var size = 1
        var copy = self
        
        while copy.next != nil {
            size += 1
            copy = copy.next!
        }
        
        let rest = size - (by % size)
        
        let root = self
        var current = self
        
        for _ in 1..<rest {
            if let next = current.next {
                current = next
            }
        }
        
        if let next = current.next {
            let tail = current
            tail.next = nil
            
            let head = next
            current = head
            
            while current.next != nil {
                current = current.next!
            }
            
            current.next = root
            return head
        } else {
         
            return root
        }
    }
}
