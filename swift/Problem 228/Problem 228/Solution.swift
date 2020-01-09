//
//  Solution.swift
//  Problem 228
//
//  Created by sebastien FOCK CHOW THO on 2020-01-08.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func maximumConcat() -> Int {
        
        var candidates: [[Int]] = []
        
        for i in 0..<count {
            var copy = self
            var row: [Int] = []
            row.append(copy.remove(at: i))
            candidates.append(contentsOf: [row].next(remaining: copy))
        }
        
        let mapped = candidates.map{
            $0.reduce("") { return "\($0)\($1)" }
        }
        
        let toInt: [Int] = mapped.map{ Int($0) ?? 0 }
        let sorted = toInt.sorted{ $0 > $1 }
        
        return sorted.first ?? 0
    }
}

extension Array where Element == Array<Int> {
    
    func next(remaining: [Int]) -> [[Int]] {
        
        var result: [[Int]] = []
        
        for item in self {
            for i in 0..<remaining.count {
                var copy = remaining
                let value = copy.remove(at: i)
                
                var current = item
                current.append(value)
                
                if copy.isEmpty {
                    result.append(current)
                } else {
                    result.append(contentsOf: [current].next(remaining: copy))
                }
            }
        }
        
        return result
    }
}
