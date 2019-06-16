//
//  Solution.swift
//  Problem 15
//
//  Created by sebastien FOCK CHOW THO on 2019-06-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

// https://www.geeksforgeeks.org/select-a-random-number-from-stream-with-o1-space/

struct Random {
    
    var result = 0
    var count = 0
    
    mutating func selectRandom(x: Int) -> Int {
        count += 1
        
        if (count == 1) {
            result = count
        } else {
            let rand = Int.random(in: 0...(count-1))
            
            if (rand == count - 1) {
                result = x
            }
        }
        
        return result
    }
}
