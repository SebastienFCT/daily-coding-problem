//
//  Solution.swift
//  Problem 337
//
//  Created by sebastien FOCK CHOW THO on 2020-04-26.
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
    
    func toString() -> String {
        
        var result = "\(self.value)"
        
        if let next = next {
            result += "->\(next.toString())"
        }
        
        return result
    }
}

struct LinkedList {
    var root: Node
    
    // Found uniform definition here: https://cs.stackexchange.com/a/47342
    
    mutating func uniformShuffle() {
        
        var nodes = allNodes()
        
        for i in 0..<nodes.count {
            let rand = Int.random(in: i...nodes.count-1)
            let tmp = nodes[rand]
            nodes[rand] = nodes[i]
            nodes[i] = tmp
        }
        
        let newRoot = nodes[0]
        var current: Node? = newRoot
        
        for i in 1..<nodes.count {
            current!.next = nodes[i]
            current = current?.next
        }
        
        current?.next = nil
        
        root = newRoot
    }
    
    func allNodes() -> [Node] {
        
        var result: [Node] = []
        
        var current: Node? = root
        
        while current != nil {
            result.append(current!)
            current = current?.next
        }
        
        return result
    }
}
