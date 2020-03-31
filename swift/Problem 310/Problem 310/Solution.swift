//
//  Solution.swift
//  Problem 310
//
//  Created by sebastien FOCK CHOW THO on 2020-03-30.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Int {
    
    func countSetBits() -> Int {
        
        if self <= 0 {
            return 0
        }
        
        let rest = self / 2
        
        return (self % 2 == 0 ? 0 : 1) + rest.countSetBits()
    }
}
