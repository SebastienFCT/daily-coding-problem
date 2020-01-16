//
//  Solution.swift
//  Problem 235
//
//  Created by sebastien FOCK CHOW THO on 2020-01-15.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func minMax() -> (min: Int, max: Int, comparisonCount: Int) {
        
        guard count > 0 else {
            fatalError("array is empty")
        }
        
        var comparisonCount = 0
        var min = self[0]
        var max = self[0]
        
        for i in 1..<count {
            comparisonCount += 1
            if self[i] < min {
                min = self[i]
                continue
            } else if self[i] > max {
                max = self[i]
            }
            comparisonCount += 1
        }
        
        return (min, max, comparisonCount)
    }
}
