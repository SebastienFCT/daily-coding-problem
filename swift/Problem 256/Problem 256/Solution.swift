//
//  Solution.swift
//  Problem 256
//
//  Created by sebastien FOCK CHOW THO on 2020-02-05.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
        self.next = nil
    }
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
    
    func alternateValues() -> Node {
        
        let nodes = allNodes()
        let sorted = nodes.sorted{ $0.value < $1.value }
        
        let root = sorted[0]
        var current = root
        
        var ascending = false
        var index = 2
        
        while index < sorted.count {
            let next = sorted[index]
            current.next = next
            current = next
            
            if ascending {
                index += 3
            } else {
                index -= 1
            }
            
            ascending.toggle()
        }
        
        if index < sorted.count-1 {
            let tail = sorted.last!
            tail.next = nil
            current.next = tail
        } else {
            current.next = nil
        }
        
        return root
    }
    
    func allNodes() -> [Node] {
        
        var result: [Node] = []
        
        result.append(self)
        
        if let next = next {
            result.append(contentsOf: next.allNodes())
        }
        
        return result
    }
    
    func forPrinting() -> String {
        
        var result = "\(value)"
        
        if let next = next {
            result = "\(result)->\(next.forPrinting())"
        }
        
        return result
    }
}
