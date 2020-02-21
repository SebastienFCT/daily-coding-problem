//
//  Solution.swift
//  Problem 271
//
//  Created by sebastien FOCK CHOW THO on 2020-02-20.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func quickContains(value: Int) -> Bool {
        
        // Must be sorted
        
        guard value >= first! && value <= last! else {
            return false
        }
        
        let current = self[count/2]
        
        if current == value { return true }
        
        if current > value {
            return Array(prefix(count/2)).quickContains(value: value)
        } else {
            return Array(suffix(count/2)).quickContains(value: value)
        }
    }
}
