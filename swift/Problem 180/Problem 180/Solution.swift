//
//  Solution.swift
//  Problem 180
//
//  Created by sebastien FOCK CHOW THO on 2019-11-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Stack {
    var value: [Int]
    
    mutating func push(element: Int) {
        value.append(element)
    }
    
    mutating func pop() -> Int? {
        if value.isEmpty {
            return nil
        }
        
        return value.removeLast()
    }
}

struct Queue {
    var value: [Int]
    
    mutating func enqueue(element: Int) {
        value.insert(element, at: 0)
    }
    
    mutating func dequeue() -> Int? {
        if value.isEmpty {
            return nil
        }
        
        return value.removeLast()
    }
}

extension Stack {
    mutating func interleave(count: Int = 1) {
        var queue = Queue(value: [])
        
        for _ in 0...value.count-1-count {
            queue.enqueue(element: self.pop()!)
        }
        
        while !queue.value.isEmpty {
            self.push(element: queue.dequeue()!)
        }
        
        if count < value.count-1 {
            interleave(count: count+1)
        }
    }
}
