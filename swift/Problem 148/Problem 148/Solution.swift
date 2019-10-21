//
//  Solution.swift
//  Problem 148
//
//  Created by sebastien FOCK CHOW THO on 2019-10-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct AppleGrayCode {
    
    func possibilities(for n: Int) -> [[Int]] {
        var result: [[Int]] = []
        
        for _ in 0...n-1 {
            if result.isEmpty {
                result.append(contentsOf: [[0], [1]])
            } else {
                result = result.grayCodes()
            }
        }
        
        return result
    }
}

extension Array where Element == [Int] {
    func grayCodes() -> [[Int]] {
        var result: [[Int]] = []
        
        for element in self {
            var first = element
            first.append(0)
            result.append(first)
            
            var second = element
            second.append(1)
            result.append(second)
        }
        
        return result
    }
}
