//
//  Solution.swift
//  Problem 101
//
//  Created by sebastien FOCK CHOW THO on 2019-09-03.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

func findPrimeCouple(forValue value: Int) -> (first: Int, second: Int) {
    
    guard value % 2 == 0 && value > 2 else {
        fatalError("value must be even and greater than 2")
    }
    
    var allPrimes: [Int] = []
    
    for i in 2...value {
        if allPrimes.containsDivider(forValue: i) {
            continue
        }
        
        allPrimes.append(i)
        
        for j in i...value {
            if allPrimes.containsDivider(forValue: j) {
                continue
            }
            
            allPrimes.append(j)
            
            if i + j == value {
                return (i, j)
            }
        }
    }
    
    fatalError("Didn't find a couple for the value \(value)")
}

extension Array where Element == Int {
    func containsDivider(forValue value: Int) -> Bool {
        
        for item in self {
            if value != item && value % item == 0 {
                return true
            }
        }
        
        return false
    }
}
