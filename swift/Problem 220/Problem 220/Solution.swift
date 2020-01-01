//
//  Solution.swift
//  Problem 220
//
//  Created by sebastien FOCK CHOW THO on 2019-12-31.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct TheCoinGame {
    var coins: [Int]
    
    func maximum() -> Int {
        
        // Test starting from left
        
        var copyStartFromLeft = coins
        var p1StartFromLeft = copyStartFromLeft.removeFirst()
        var p2StartFromLeft = 0
        
        var index = 1
        while !copyStartFromLeft.isEmpty {
            if index % 2 == 0 {
                p1StartFromLeft += copyStartFromLeft.nextGreater()
            } else {
                p2StartFromLeft += copyStartFromLeft.nextGreater()
            }
            
            index += 1
        }
        
        // Test starting from right
        
        var copyStartFromRight = coins
        var p1StartFromRight = copyStartFromRight.removeLast()
        var p2StartFromRight = 0
        
        index = 1
        while !copyStartFromRight.isEmpty {
            if index % 2 == 0 {
                p1StartFromRight += copyStartFromRight.nextGreater()
            } else {
                p2StartFromRight += copyStartFromRight.nextGreater()
            }
            
            index += 1
        }
        
        return max(p1StartFromLeft, p1StartFromRight)
    }
}

extension Array where Element == Int {
    
    mutating func nextGreater() -> Int {
        
        if count == 0 {
            return 0
        }
        
        if count == 1 {
            return self.removeFirst()
        }
        
        if let left = self.first, let right = self.last {
            if left == right {
                if count <= 3 {
                    return self.removeFirst()
                }
                
                let nextLeft = self[1]
                let nextRight = self[count-2]
                
                if nextLeft == nextRight {
                    return self.removeFirst()
                }
                
                if nextRight < nextLeft {
                    return self.removeLast()
                } else {
                    return self.removeFirst()
                }
            }
            
            if left > right {
                return self.removeFirst()
            } else {
                return self.removeLast()
            }
        }
        
        return 0
    }
}
