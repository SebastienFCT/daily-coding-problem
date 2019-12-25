//
//  Solution.swift
//  Problem 214
//
//  Created by sebastien FOCK CHOW THO on 2019-12-25.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Int {
    
    func longestConsecutiveOnes() -> Int {
        return longestConsecutive(value: 1)
    }
    
    func longestConsecutive(value: Int) -> Int {
        return self.bitRepresentation().longestConsecutive(value: value)
    }
    
    func bitRepresentation() -> [Int] {
        let bitRepresentation = String(self, radix: 2)
        
        var result: [Int] = []
        
        for char in bitRepresentation {
            result.append(Int(String(char))!)
        }
        
        return result
    }
}

extension Array where Element == Int {
    
    func longestConsecutive(value: Int) -> Int {
        
        var max = 0
        
        for i in 0..<count-1 {
            
            var current = 0
            
            for j in i..<count {
                if self[j] != value {
                    break
                }
                
                current += 1
                if current > max { max = current }
            }
        }
        
        return max
    }
}
