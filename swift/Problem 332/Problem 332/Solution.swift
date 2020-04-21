//
//  Solution.swift
//  Problem 332
//
//  Created by sebastien FOCK CHOW THO on 2020-04-21.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct JSProblem {
    
    var m: Int
    var n: Int
    
    func findPairs() -> [(Int, Int)] {
        
        guard m > 0, n > 0 else {
            fatalError("m and n must be positive")
        }
        
        var result: [(Int, Int)] = []
        
        for i in 0...m/2 {
            
            if i ^ (m-i) == n {
                result.append((i, m-i))
            }
        }
        
        return result
    }
}
