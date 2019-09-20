//
//  Solution.swift
//  Problem 117
//
//  Created by sebastien FOCK CHOW THO on 2019-09-19.
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
    
    typealias NodeLevelAndSum = (level: Int, sum: Int)
    
    func minimumSum(currentLevel: Int, currentSum: Int) -> NodeLevelAndSum {
        
        var candidates: [NodeLevelAndSum] = [(level: currentLevel, sum: currentSum)]
        
        if let left = left {
            candidates.append(left.minimumSum(currentLevel: currentLevel + 1, currentSum: currentSum + left.value))
        }
        
        if let right = right {
            candidates.append(right.minimumSum(currentLevel: currentLevel + 1, currentSum: currentSum + right.value))
        }
        
        return candidates.sorted{ $0.sum < $1.sum }.first!
    }
}
