//
//  Solution.swift
//  Problem 244
//
//  Created by sebastien FOCK CHOW THO on 2020-01-24.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct SieveOfEratosthenes {
    
    func primes(before: Int) -> [Int] {
        
        var result: [Int] = []
        var nonPrimes: Set<Int> = Set()
        
        for i in 2..<before {
            if !nonPrimes.contains(i) {
                result.append(i)
            }
            
            var index = result.last! + result.last!
            
            while index < before {
                nonPrimes.insert(index)
                index += result.last!
            }
        }
        
        return result
    }
    
    func allPrimes(count: Int) {
        
        var index = 2
        var iteration = 0
        var list: [Int] = []
        
        while iteration < count {
            if !list.contains(where: { (item) -> Bool in
                return index % item == 0
            }) {
                print(index)
                iteration += 1
                list.append(index)
            }
            
            index += 1
        }
    }
}
