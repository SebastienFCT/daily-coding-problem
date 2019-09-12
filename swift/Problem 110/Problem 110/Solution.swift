//
//  Solution.swift
//  Problem 110
//
//  Created by sebastien FOCK CHOW THO on 2019-09-12.
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
    
    func paths() -> [[Int]] {
        var result: [[Int]] = []
        
        if left == nil && right == nil {
            return [[value]]
        }
        
        if let left = left {
            for subPath in left.paths() {
                result.append([value] + subPath)
            }
        }
        
        if let right = right {
            for subPath in right.paths() {
                result.append([value] + subPath)
            }
        }
        
        return result
    }
}
