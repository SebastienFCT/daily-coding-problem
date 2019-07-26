//
//  Solution.swift
//  Problem 61
//
//  Created by sebastien FOCK CHOW THO on 2019-07-25.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    My first intuition for this problem is to see how I can decompose the exponential operation. For example:
 
    - 2^4 = 2*2*2*2 which is also equal to 4*4. 4*4 = 4^2 => `2^4 = 4^2`
    - 4^5 = 4*4*4*4*4 = 4*4^4 = 4*16^2
 
 */
func exponential(base: Int, exponent: Int) -> Int {
    var base = base
    var exponent = exponent
    var result = 1
    
    while true {
        if exponent % 2 == 1 {
            result *= base
        }
        
        exponent = exponent / 2
        
        if exponent == 0 { break }
        
        base = base * base
    }
    
    return result
}
