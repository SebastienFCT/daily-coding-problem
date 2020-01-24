//
//  Solution.swift
//  Problem 243
//
//  Created by sebastien FOCK CHOW THO on 2020-01-23.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func minimumSumForKPartitions(k: Int) -> Int {
        
        guard count > 0 else {
            fatalError("empty array")
        }
        
        let candidates = split(partitionsSize: k, base: [])
        let sums = candidates.map{ $0.map{ $0.reduce(0) { $0 + $1 } } }
        let maxValues = sums.map{ $0.reduce(0) { $1 > $0 ? $1 : $0 } }
        let sorted = maxValues.sorted{ $0 < $1 }
        
        return sorted.first!
    }
    
    func split(partitionsSize k: Int, base: [[Int]]) -> [[[Int]]] {
        
        var result: [[[Int]]] = []
        
        if k > 1 {
            for i in 0..<count-k {
                
                var copy = base
                
                copy.append(Array(self[0...i]))
                result.append(contentsOf: Array(self[i+1...count-1]).split(partitionsSize: k-1, base: copy))
            }
        } else {
            var copy = base
            copy.append(self)
            result.append(copy)
        }
        
        return result
    }
}
