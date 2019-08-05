//
//  Solution.swift
//  Problem 71
//
//  Created by sebastien FOCK CHOW THO on 2019-08-04.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct TwoSigma {
    static func rand7() -> Int {
        return Int.random(in: 1...7)
    }
    
    static func rand5() -> Int {
        var result: Int = 0
        
        while result <= 0 || result > 5 {
            result = TwoSigma.rand7()
        }
        
        return result
    }
}
