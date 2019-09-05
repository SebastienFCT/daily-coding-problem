//
//  Solution.swift
//  Problem 102
//
//  Created by sebastien FOCK CHOW THO on 2019-09-04.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func contiguousElement(forSum sum: Int) -> [Int] {
        
        var result: [Int] = []
        
        for i in 0..<count {
            result = []
            
            if self[i] == sum {
                return [self[i]]
            }
            
            result.append(self[i])
            
            let rest = Array(self.suffix(count-i-1))
            
            for item in rest {
                result.append(item)
                
                let currentSum = result.reduce(0){ $0 + $1 }
                if currentSum == sum {
                    return result
                }
                
                if currentSum > sum {
                    break
                }
            }
        }
        
        return []
    }
}
