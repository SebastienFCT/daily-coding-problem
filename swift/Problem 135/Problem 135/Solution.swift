//
//  Solution.swift
//  Problem 135
//
//  Created by sebastien FOCK CHOW THO on 2019-10-07.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    func minPath() -> [Node] {
        let paths = allPaths(current: [self])
        let sums = paths.map{ $0.map{ $0.value }.reduce(0, +) }
        let min = sums.min()
        let minIndex = sums.indices.filter{ sums[$0] == min! }
        
        return paths[minIndex.first!]
    }
    
    private func allPaths(current: [Node]) -> [[Node]] {
        
        if left == nil && right == nil {
            return [current]
        }
        
        var result: [[Node]] = []
        
        if let left = left {
            var new = current
            new.append(left)
            
            result.append(contentsOf: left.allPaths(current: new))
        }
        
        if let right = right {
            var new = current
            new.append(right)
            
            result.append(contentsOf: right.allPaths(current: new))
        }
        
        return result
    }
}
