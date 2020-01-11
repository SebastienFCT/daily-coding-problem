//
//  Solution.swift
//  Problem 1c
//
//  Created by sebastien FOCK CHOW THO on 2020-01-10.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func hasCombination(withCount n: Int, forSum k: Int) -> Bool {
        
        let candidates = next(current: [], maxLength: n)
        let mapped = candidates.map{ $0.reduce(0, { $0 + $1 }) }
        
        return mapped.contains(k)
    }
    
    private func next(current: [Int], maxLength: Int) -> [[Int]] {
        
        if count == maxLength {
            return [self]
        }
        
        var result: [[Int]] = []
        
        for i in 0..<count {
            let item = self[i]
            
            var copy = current
            copy.append(item)
            
            var left = self
            left.remove(at: i)
            
            result.append(contentsOf: copy.next(current: copy, maxLength: maxLength))
        }
        
        return result
    }
}
