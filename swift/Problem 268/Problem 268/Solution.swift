//
//  Solution.swift
//  Problem 268
//
//  Created by sebastien FOCK CHOW THO on 2020-02-17.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Int {
    
    // O(log N)
    func isPowerOfFour() -> Bool {
        
        var copy = self
        while copy != 1 {
            if copy % 4 != 0 {
                return false
            }
            
            copy /= 4
        }
        
        return true
    }
}
