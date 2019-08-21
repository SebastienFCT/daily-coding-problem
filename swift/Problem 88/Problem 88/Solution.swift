//
//  Solution.swift
//  Problem 88
//
//  Created by sebastien FOCK CHOW THO on 2019-08-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct GoogleCalculator {
    
    func customQuotientDivision(dividend: Int, divisor: Int) -> Int {
        guard divisor != 0 else {
            fatalError("divisor can't be 0")
        }
        
        return findHowManyTime(x: divisor, inTotal: dividend).count
    }
    
    func findHowManyTime(x: Int, inTotal total: Int) -> (count: Int, sum: Int) {
        var count = 0
        var sum = 0
        
        while sum < total {
            count += 1
            sum += x
        }
        
        if sum > total {
            return (count: count-1, sum: sum-x)
        }
        
        return (count: count, sum: sum)
    }
}
