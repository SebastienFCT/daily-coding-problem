//
//  Solution.swift
//  Problem 305
//
//  Created by sebastien FOCK CHOW THO on 2020-03-25.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
    
    func toPrint() -> String {
        
        var result = "\(value)"
        
        if let next = next {
            result = "\(result)->\(next.toPrint())"
        }
        
        return result
    }
}


struct LinkedList {
    var root: Node?
    
    func removeConsecutiveNodesWithZeroSum() -> String {
        
        var result = ""
        var start = root
        var end = start
        
        while start != nil {
            
            var hasChanged = false
            var cumul = 0
            end = start
            
            while end != nil {
                cumul += end!.value
                
                if cumul == 0 {
                    start = end
                    hasChanged = true
                    break
                }
                
                end = end?.next
            }
            
            if !hasChanged && start != nil {
                result = result.isEmpty ? "\(result)\(start!.value)" : "\(result)->\(start!.value)"
            }
            
            start = start?.next
        }
        
        return result
    }
}
