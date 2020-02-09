//
//  Solution.swift
//  Problem 260
//
//  Created by sebastien FOCK CHOW THO on 2020-02-09.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct JumbledSequence {
    
    // Solution found at https://github.com/vineetjohn/daily-coding-problem
    
    func solve(input: [Character]) -> [Int] {
        
        guard (input.filter{ $0 != "+" && $0 != "-"  }.count == 0) else {
            fatalError("input invalid")
        }
        
        var result: [Int] = []
        let addCount = input.filter{ $0 == "+" }.count
        
        let firstValue = input.count - addCount
        var smallerValue = firstValue - 1
        var greaterValue = firstValue + 1
        
        result.append(firstValue)
        
        for i in 0..<input.count {
            if input[i] == "+" {
                result.append(greaterValue)
                greaterValue += 1
            } else {
                result.append(smallerValue)
                smallerValue -= 1
            }
        }
        
        return result
    }
}
