//
//  Solution.swift
//  Problem 154
//
//  Created by sebastien FOCK CHOW THO on 2019-10-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Stack {
    var heap: Heap
    var lastAddedKeys: [Int]
    
    init() {
        self.heap = Heap()
        self.lastAddedKeys = []
    }
    
    func push(item: Int) {
        self.heap.push(item: item)
        lastAddedKeys.append(item)
    }
    
    func pop() -> Int? {
        var trace: [Int] = []
        
        while (true) {
            guard let next = heap.pop() else {
                return nil
            }
            
            if let lastAdded = lastAddedKeys.last, next == lastAdded {
                for item in trace {
                    self.heap.push(item: item)
                }
                
                lastAddedKeys.removeLast()
                return next
            }
            
            trace.append(next)
        }
    }
}

class Heap {
    var items: [Int]
    
    init() {
        self.items = []
    }
    
    func push(item: Int) {
        self.items.append(item)
    }
    
    func pop() -> Int? {
        guard self.items.count > 0 else {
            return nil
        }
        
        var sorted = self.items.sorted()
        let item = sorted.removeLast()
        
        self.items = sorted
        
        return item
    }
}
