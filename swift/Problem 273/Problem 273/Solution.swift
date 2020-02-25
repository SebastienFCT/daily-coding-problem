//
//  Solution.swift
//  Problem 273
//
//  Created by sebastien FOCK CHOW THO on 2020-02-24.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct FixedPoint {
    
    var input: [Int]
    
    func anyFixedPoint() -> Any {
        
        for i in 0..<input.count {
            if input[i] == i {
                return i
            }
        }
        
        return false
    }
}
