//
//  Solution.swift
//  Problem 282
//
//  Created by sebastien FOCK CHOW THO on 2020-03-02.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func pythogoranTriplet() -> [Int]? {
        
        guard count >= 3 else {
            return nil
        }
        
        for i in 0..<count-1 {
            
            for j in i..<count {
                
                for k in 0..<count {
                    
                    if k == i || k == j {
                        continue
                    }
                    
                    if self[i] * self[i] + self[j] * self[j] == self[k] * self[k] {
                        return [self[i], self[j], self[k]]
                    }
                }
            }
        }
        
        return nil
    }
}
