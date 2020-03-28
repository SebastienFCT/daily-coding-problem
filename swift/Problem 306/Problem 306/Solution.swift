//
//  Solution.swift
//  Problem 306
//
//  Created by sebastien FOCK CHOW THO on 2020-03-27.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    mutating func finishSorting(maxDistance k: Int) {
        
        var ref: Int
        
        for i in 1..<count {
                
            ref = self[i]
            var j = i-1
            
            while j >= 0 && self[j] > ref {
                self[j+1] = self[j]
                j = j-1
            }
            
            self[j+1] = ref
        }
    }
}
