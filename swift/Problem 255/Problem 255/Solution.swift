//
//  Solution.swift
//  Problem 255
//
//  Created by sebastien FOCK CHOW THO on 2020-02-04.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Int> {
    
    func transitiveClosure() -> [[Int]] {
        
        var result: [[Int]] = []
        
        let defaultRow = Swift.Array(repeating: 0, count: count)
        for _ in 0..<count {
            result.append(defaultRow)
        }
        
        for i in 0..<count {
            
            for reference in self[i] {
                
                result[i][reference] = 1
            }
        }
        
        return result
    }
}
