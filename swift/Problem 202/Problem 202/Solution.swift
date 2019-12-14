//
//  Solution.swift
//  Problem 202
//
//  Created by sebastien FOCK CHOW THO on 2019-12-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Int {
    
    func isPalindrome() -> Bool {
        
        var n = self
        var reversed = 0
        var remainder = 0
        
        while n != 0 {
            remainder = n % 10
            reversed = reversed * 10 + remainder
            n /= 10
        }
        
        return self == reversed
        
    }
}
