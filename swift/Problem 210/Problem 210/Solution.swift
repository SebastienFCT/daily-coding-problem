//
//  Solution.swift
//  Problem 210
//
//  Created by sebastien FOCK CHOW THO on 2019-12-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

func longestCollatzSequence() -> [Int] {
    var result: [Int] = []
    
    for i in 2...1000000 {
        let collatz = testCollatz(withInt: i)
        
        if collatz.count > result.count {
            result = collatz
        }
    }
    
    return result
}

func testCollatz(withInt: Int) -> [Int] {
    var sequence = [withInt]
    var current = withInt
    
    while true {
        
        if current == 1 {
            return sequence
        }
        
        if current % 2 == 0 {
            current = current / 2
        } else {
            current = (current * 3) + 1
        }
        
        sequence.append(current)
    }
    
    return sequence
}
