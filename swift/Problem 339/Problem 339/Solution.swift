//
//  Solution.swift
//  Problem 339
//
//  Created by sebastien FOCK CHOW THO on 2020-04-28.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func countainsTrio(withSum sum: Int) -> Bool {
        
        for i in 0..<count-2 {
            
            for j in i+1..<count-1 {
                
                for k in j+1..<count {
                    
                    if self[i] + self[j] + self[k] == sum {
                        return true
                    }
                }
            }
        }
        
        return false
    }
}
