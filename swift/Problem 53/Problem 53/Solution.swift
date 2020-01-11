//
//  Solution.swift
//  Problem 53
//
//  Created by sebastien FOCK CHOW THO on 2019-07-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct FIFO {
    var stack1: [Any]
    var stack2: [Any]
    
    mutating func enqueue(item: Any) {
        stack1.insert(item, at: 0)
    }
    
    mutating func dequeue() {
        // Insert each element in the other stack, so the order is reversed
        for item in stack1 {
            stack2.insert(item, at: 0)
        }
        
        // Clear the first stack
        stack1 = []
        
        // Remove the first element of the second stack (that's the first element that was inserted in the stack 1
        stack2.removeFirst()
        
        // Reverse back the element to stack 1 so that the next ones can be inserted
        for item in stack2 {
            stack1.insert(item, at: 0)
        }
        
        stack2 = []
    }
}
