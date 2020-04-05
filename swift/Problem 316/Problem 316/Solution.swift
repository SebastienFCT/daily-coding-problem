//
//  Solution.swift
//  Problem 316
//
//  Created by sebastien FOCK CHOW THO on 2020-04-05.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func denominations() -> [Int] {
        
        var result: [Int] = []
        var ways: [Int] = Array(repeating: 0, count: count)
        
        for i in 1..<count {
            
            if ways[i] >= self[i] {
                continue
            }
            
            result.append(i)
            ways[i] += 1
        }
        
        
        return result
    }
}
