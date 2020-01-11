//
//  Solution.swift
//  Problem 49
//
//  Created by sebastien FOCK CHOW THO on 2019-07-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    func findLargestConsecutiveSum() -> Int {
        var sum = 0
        
        for element in self {
            sum += element
            if element > sum {
                sum = element
            }
        }
        
        return sum > 0 ? sum : 0
    }
}
