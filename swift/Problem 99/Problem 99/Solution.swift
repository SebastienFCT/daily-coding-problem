//
//  Solution.swift
//  Problem 99
//
//  Created by sebastien FOCK CHOW THO on 2019-09-01.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    func longestConsecutiveSubsequence() -> Int {
        
        var copy = self.sorted{ $0 < $1 }
        var references: [Int : Int] = [:]
        
        for i in 0..<count {
            if references[copy[i]-1] != nil {
                let val = references[copy[i]-1]!
                references.removeValue(forKey: copy[i]-1)
                references[copy[i]] = val + 1
            } else {
                references[copy[i]] = 1
            }
        }
        
        return references.values.sorted{ $0 > $1 }.first ?? 0
    }
}
