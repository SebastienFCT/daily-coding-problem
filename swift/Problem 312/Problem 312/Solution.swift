//
//  Solution.swift
//  Problem 312
//
//  Created by sebastien FOCK CHOW THO on 2020-04-01.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Board {
    var columns: Int
    
    func countUniqueConfiguration(remainingSpace: Int? = nil) -> Int {
        
        let remainingSpace = remainingSpace ?? columns * 2
        
        var result = 0
        
        if remainingSpace > 3 {
            result += countUniqueConfiguration(remainingSpace: remainingSpace-3)
            result += countUniqueConfiguration(remainingSpace: remainingSpace-2)
        }
        
        // last tromino
        if remainingSpace == 3 {
            return 1
        }
        
        // last domino
        if remainingSpace == 2 {
            return 1
        }
        
        return result
    }
}
