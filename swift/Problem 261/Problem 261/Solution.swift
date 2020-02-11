//
//  Solution.swift
//  Problem 261
//
//  Created by sebastien FOCK CHOW THO on 2020-02-10.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct HuffmanTree {
    
    var characterFrequency: [Character : Int]
    
    func buildTree() -> Node? {
        
        let mapped = characterFrequency.map{ ($0.key, $0.value) }
        let sorted = mapped.sorted{ $0.1 > $1.1 }
        var sortedNodes = sorted.map{ Node(value: $0.0, frequency: $0.1) }
        
        while sortedNodes.count > 1 {
            let left = sortedNodes.remove(at: 0)
            let right = sortedNodes.remove(at: 0)
            
            let node = Node(value: "_", frequency: left.frequency + right.frequency)
            node.left = left
            node.right = right
            
            sortedNodes.append(node)
        }
        
        return sortedNodes.first
    }
}

class Node {
    var value: Character
    var frequency: Int
    var left: Node?
    var right: Node?
    
    init(value: Character, frequency: Int) {
        self.value = value
        self.frequency = frequency
        self.left = nil
        self.right = nil
    }
    
    init(value: Character, frequency: Int, left: Node?, right: Node?) {
        self.value = value
        self.frequency = frequency
        self.left = left
        self.right = right
    }
    
    func toHuffmanEncoding(current: String) -> [Character : String] {
        
        var result: [Character : String] = [:]
        
        if value != "_" {
            result[value] = current
        } else {
            if let left = left {
                result = result.merging(left.toHuffmanEncoding(current: "\(current)0")){ (current, _) in current }
            }
            if let right = right {
                result = result.merging(right.toHuffmanEncoding(current: "\(current)1")){ (current, _) in current }
            }
        }
        
        return result
    }
}
