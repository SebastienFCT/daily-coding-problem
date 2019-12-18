//
//  Solution.swift
//  Problem 206
//
//  Created by sebastien FOCK CHOW THO on 2019-12-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func applyPermutation(permutation: [Int]) {
        
        var copy = self
        var viewed: Set<Int> = Set()
        
        for i in 0..<count {
            if viewed.contains(i) { continue }
            
            if permutation[i] != i {
                copy[i] = self[permutation[i]]
                copy[permutation[i]] = self[i]
                
                viewed.insert(permutation[i])
            } else {
                copy[i] = self[i]
            }
            
            viewed.insert(i)
            
            if viewed.count == count {
                self = copy
            }
        }
        
        self = copy
        
    }
}
