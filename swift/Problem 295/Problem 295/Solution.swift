//
//  Solution.swift
//  Problem 295
//
//  Created by sebastien FOCK CHOW THO on 2020-03-15.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct PascalTriangle {
    
    func getRow(n: Int) -> [Int] {
        
        if n == 0 {
            fatalError("n must be greater than 0")
        }
        
        if n == 1 {
            return [1]
        }
        
        var result: [Int] = Array(repeating: 0, count: n)
        
        let previous = getRow(n: n-1)
        for i in 0..<result.count {
            
            if i != 0 {
                result[i] += previous[i-1]
            }
            
            if i != result.count-1 {
                result[i] += previous[i]
            }
        }
        
        return result
    }
}
