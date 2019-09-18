//
//  Solution.swift
//  Problem 4
//
//  Created by sebastien FOCK CHOW THO on 2019-06-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    func lowerMissingPositiveInteger() -> Int {
        var index = 1
        
        while (true) {
            if !self.contains(index) {
                return index
            }
            
            index += 1
        }
    }
}

extension Array where Element == Int {
    func lowerMissingPositiveInteger2() -> Int {
        let sortedAndPositive = self.sorted{ $0 < $1}.filter{ $0 > 0 }
        
        var lastValue = 0
        
        for element in sortedAndPositive {
            if element != lastValue + 1 {
                return lastValue + 1
            }
            
            lastValue += 1
        }
        
        return lastValue + 1
    }
}
