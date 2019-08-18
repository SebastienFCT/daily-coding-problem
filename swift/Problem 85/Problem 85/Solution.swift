//
//  Solution.swift
//  Problem 85
//
//  Created by sebastien FOCK CHOW THO on 2019-08-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    The logic here to to write an arithmetic expression that adds both x and y and cancel one of them depending on the value of b
 
    - We can return x + y
    - b can only be 1 or 0 so we can return xb + y
    - now if b = 1, y should be equal to 0, we can write it like this xb + abs(1-b)y
 
 */

struct FacebookChallenge {
    static func binarySelection(x: Int32, y: Int32, b: Int32) -> Int32 {
        return (b * x) + (abs(1-b) * y)
    }
}
