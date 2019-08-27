//
//  Solution.swift
//  Problem 94
//
//  Created by sebastien FOCK CHOW THO on 2019-08-27.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var val: Int
    var left: Node?
    var right: Node?
    
    init(val: Int, left: Node?, right: Node?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    func pathSums() -> (left: Int, right: Int) {
        var result = (left: 0, right: 0)
        
        if let left = left {
            result.left = left.val + val
        }
        
        if let right = right {
            result.right = right.val + val
        }
        
        return result
    }
    
    func maxPathSum() -> Int {
        if left != nil && right != nil {
            return max(pathSums().left, pathSums().right, left!.maxPathSum(), right!.maxPathSum())
        } else if left != nil {
            return max(pathSums().left, pathSums().right, left!.maxPathSum())
        } else if right != nil {
            return max(pathSums().left, pathSums().right, right!.maxPathSum())
        } else {
            return max(pathSums().left, pathSums().right)
        }
    }
}
