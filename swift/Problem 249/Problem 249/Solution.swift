//
//  Solution.swift
//  Problem 249
//
//  Created by sebastien FOCK CHOW THO on 2020-01-29.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func xOrCount() -> Int {
        
        var results: [Int] = []
        
        for i in 0..<count-1 {
            for j in i+1..<count {
                
                var result = 0
                
                for k in 0..<count {
                    if (k == i || k == j) { continue }
                    
                    if ((self[k] == self[i] && self[k] != self[j]) || (self[k] != self[i] && self[k] == self[j])) {
                        result += 1
                    }
                }
                
                results.append(result)
            }
        }
        
        let sorted = results.sorted{ $0 > $1 }
        
        return sorted.first ?? 0
    }
}
