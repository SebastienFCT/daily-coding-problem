//
//  Solution.swift
//  Problem 224
//
//  Created by sebastien FOCK CHOW THO on 2020-01-04.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func smallestPositiveIntNotInAnySumSubset() -> Int {
        
        guard count > 1 else {
            return 1
        }
        
        var result = 1
        var index = 0
        
        while result >= self[index] {
            result += self[index]
            index += 1
        }
        
        return result
    }
}
