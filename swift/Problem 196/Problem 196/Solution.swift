//
//  Solution.swift
//  Problem 196
//
//  Created by sebastien FOCK CHOW THO on 2019-12-07.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
    
    func mostFrequentSubtreeSum() -> Int {
        
        let candidates = subTreeSums()
        
        var result = 0
        var count = 0
        
        for key in candidates.keys {
            if candidates[key]! > count {
                count = candidates[key]!
                result = key
            }
        }
        
        return result
    }
    
    func subTreeSums() -> [Int: Int] {
        
        var result: [Int: Int] = [:]
        
        let currentSum = sum()
        
        if result.keys.contains(currentSum) {
            result[currentSum]! += 1
        } else {
            result[currentSum] = 1
        }
        
        if let left = left {
            let leftResults = left.subTreeSums()
            
            for key in leftResults.keys {
                if result.keys.contains(key) {
                    result[key]! += leftResults[key]!
                } else {
                    result[key] = leftResults[key]!
                }
            }
        }
        
        if let right = right {
            let rightResults = right.subTreeSums()
            
            for key in rightResults.keys {
                if result.keys.contains(key) {
                    result[key]! += rightResults[key]!
                } else {
                    result[key] = rightResults[key]!
                }
            }
        }
        
        return result
    }
    
    func sum() -> Int {
        
        var result = value
        
        if let left = left {
            result += left.sum()
        }
        
        if let right = right {
            result += right.sum()
        }
        
        return result
    }
}
