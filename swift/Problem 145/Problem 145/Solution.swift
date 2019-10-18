//
//  Solution.swift
//  Problem 145
//
//  Created by sebastien FOCK CHOW THO on 2019-10-17.
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
    
    func swapPairs() -> Node? {
        let allNodes = nodes()
        var root: Node? = nil
        var current: Node? = nil
        
        for i in 0..<allNodes.count {
            if i % 2 != 0 {
                let copy = allNodes[i]
                copy.next = allNodes[i-1]
                
                if current != nil {
                    current?.next = copy
                }
                
                if root == nil {
                    root = copy
                }
                
                current = copy.next
            }
        }
        
        current?.next = nil
        
        return root
    }
    
    func nodes() -> [Node] {
        var result: [Node] = [self]
        
        if let next = next {
            result.append(contentsOf: next.nodes())
        }
        
        return result
    }
    
    func toString() -> String {
        var result = "\(value)"
        
        if let next = next {
            result += "->\(next.toString())"
        }
        
        return result
    }
}
