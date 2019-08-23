//
//  Solution.swift
//  Problem 90
//
//  Created by sebastien FOCK CHOW THO on 2019-08-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct GoogleLibrary {
    
    /// randomly generates a number from 0 to n-1 that isn't in l
    static func rand(n: Int, l: [Int]) -> Int {
        var result: Int = -1
        
        while (result < 0 || l.contains(result)) {
            result = Int.random(in: 0...n-1)
        }
        
        return result
    }
}
