//
//  Solution.swift
//  Problem 189
//
//  Created by sebastien FOCK CHOW THO on 2019-11-30.
//  Copyright © 2019 sebfct. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func sizeOfLongestSubarrayWithUniqueElements() -> Int {
        
        var set: Set<Int> = Set()
        
        for item in self {
            if !set.contains(item) {
                set.insert(item)
            }
        }
        
        return set.count
    }
}
