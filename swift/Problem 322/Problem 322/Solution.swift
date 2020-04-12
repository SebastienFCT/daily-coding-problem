//
//  Solution.swift
//  Problem 322
//
//  Created by sebastien FOCK CHOW THO on 2020-04-11.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Int {
    
    // Solution comes from https://www.geeksforgeeks.org/find-the-number-of-jumps-to-reach-x-in-the-number-line-from-zero/
    
    func flipkartJumpCount() -> Int {
        
        let n = abs(self)
        var result = 0
        
        // If I understand bitwise AND operator, it should return either 00000000 if the bit value is XXXXXXX0 and 00000001 otherwise since 1 = 00000001
        // 2 = 00000010
        // 3 = 00000011
        // 4 = 00000100
        // 5 = 00000101 etc... so all odd number have their last bit = 1
        
        while result.sumCount() < n || ((result.sumCount() - n) & 1) > 0 {
            print("current: \(result)")
            result += 1
        }
        
        return result
    }
    
    private func sumCount() -> Int {
        
        return (self * (self + 1)) / 2
    }
}
