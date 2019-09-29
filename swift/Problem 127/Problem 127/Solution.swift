//
//  Solution.swift
//  Problem 127
//
//  Created by sebastien FOCK CHOW THO on 2019-09-29.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var child: Node?
    
    init(value: Int, child: Node?) {
        self.value = value
        self.child = child
    }
    
    func values() -> [Int] {
        var result: [Int] = []
        
        result.append(value)
        
        if let child = child {
            result.append(contentsOf: child.values())
        }
        
        return result
    }
    
    static func + (left: Node, right: Node) -> Node {
        
        var leftValues = left.values()
        var rightValues = right.values()
        
        if leftValues.count > rightValues.count {
            rightValues = rightValues.fillToLength(length: leftValues.count)
        } else if rightValues.count > leftValues.count {
            leftValues = leftValues.fillToLength(length: rightValues.count)
        }
        
        var resultValues: [Int] = []
        var remaining = 0
        
        for i in 0..<leftValues.count {
            let sum = leftValues[i] + rightValues[i] + remaining
            let value = sum%10
            remaining = (sum-value) / 10
            
            resultValues.append(value)
        }
        
        while remaining != 0 {
            let value = remaining%10
            remaining -= value
            
            resultValues.append(value)
        }
        
        return Node.toNode(values: resultValues)
    }
    
    static func toNode(values: [Int]) -> Node {
        var copy = values
        
        let root = Node(value: copy.removeFirst(), child: nil)
        var currentNode = root
        
        while !copy.isEmpty {
            let node = Node(value: copy.removeFirst(), child: nil)
            currentNode.child = node
            currentNode = node
        }
        
        return root
    }
}

extension Array where Element == Int {
    func fillToLength(length: Int) -> [Int] {
        guard count < length else {
            fatalError("array out of bounds")
        }
        
        var copy = self
        copy.append(contentsOf: Array(repeating: 0, count: length-count))
        
        return copy
    }
}
