//
//  Solution.swift
//  Problem 204
//
//  Created by sebastien FOCK CHOW THO on 2019-12-15.
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
    
//    func countNodes() -> Int {
//        return 1 + (left?.countNodes() ?? 0) + (right?.countNodes() ?? 0)
//    }
    
    func countNodes() -> Int {
        return binaryNodeCount(currentLeft: 0, currentRight: 0)
    }
    
    func binaryNodeCount(currentLeft: Int, currentRight: Int) -> Int {
        
        var leftCount = currentLeft
        var copy: Node? = self
        
        while copy != nil {
            copy = copy?.left
            leftCount += 1
        }
        
        var rightCount = currentRight
        copy = self
        
        while copy != nil {
            copy = copy?.right
            rightCount += 1
        }
        
        if leftCount == rightCount {
            return Int(exactly: pow(Double(2), Double(leftCount-1)))!
        }
        
        return 1 + (left?.binaryNodeCount(currentLeft: leftCount-1, currentRight: 0) ?? 0) + (right?.binaryNodeCount(currentLeft: 0, currentRight: rightCount-1) ?? 0)
    }
}
