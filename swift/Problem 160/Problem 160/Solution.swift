//
//  Solution.swift
//  Problem 160
//
//  Created by sebastien FOCK CHOW THO on 2019-11-01.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    
    var value: String
    var weight: Int
    var children: [Node]
    
    init(value: String, weight: Int, children: [Node]) {
        self.value = value
        self.weight = weight
        self.children = children
    }
    
    func longestPath() -> (path: [Node], totalWeight: Int)? {
        
        let paths = allPath(from: [])
        var pathAndWeights: [(path: [Node], totalWeight: Int)] = []
        
        for path in paths {
            
            var pathAndWeight: (path: [Node], totalWeight: Int) = ([], 0)
            
            for node in path {
                pathAndWeight.path.append(node)
                pathAndWeight.totalWeight += node.weight
            }
            
            pathAndWeights.append(pathAndWeight)
        }
        
        print(pathAndWeights)
        
        let sorted = pathAndWeights.sorted{ $0.totalWeight > $1.totalWeight }
        
        if let longest = sorted.first {
            return longest
        }
        
        return nil
    }
    
    func allPath(from: [Node]) -> [[Node]] {
        var result: [[Node]] = []
        if !from.isEmpty {
            result.append(from)
        }
        
        for child in children {
            var copy = from
            copy.append(self)
            
            result.append(contentsOf: child.allPath(from: copy))
        }
        
        return result
    }
}
