//
//  Solution.swift
//  Problem 191
//
//  Created by sebastien FOCK CHOW THO on 2019-12-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Interval = (start: Int, end: Int)

func overlaps(left: Interval, right: Interval) -> Bool {
    
    let c1 = left.end < right.end && left.end > right.end
    let c2 = right.end < left.end && right.end > left.end
    
    let c3 = left.start < right.start && left.end > right.start
    let c4 = right.start < left.start && right.end > left.start
    
    return c1 || c2 || c3 || c4
}

func overlaps(left: Interval, rights: [Interval]) -> Bool {
    
    for right in rights {
        let c1 = left.end < right.end && left.end > right.end
        let c2 = right.end < left.end && right.end > left.end
        
        let c3 = left.start < right.start && left.end > right.start
        let c4 = right.start < left.start && right.end > left.start
        
        if c1 || c2 || c3 || c4 {
            return true
        }
    }
    
    return false
}

extension Array where Element == Interval {
    
    func largestNonOverlappingSubset() -> ([Interval], currentlyRemoved: Int) {
        
        var candidates: [([Interval], currentlyRemoved: Int)] = []
        
        for i in 0..<count {
            var copy = self
            let current = copy.remove(at: i)
            
            if overlaps(left: current, rights: copy) {
                candidates.append(copy.removeNext(currentlyRemoved: 1))
            }
        }
        
        _ = candidates.sorted{ $0.currentlyRemoved < $1.currentlyRemoved }
        
        return candidates.first!
    }
    
    func removeNext(currentlyRemoved: Int) -> ([Interval], currentlyRemoved: Int) {
        
        var results: [([Interval], currentlyRemoved: Int)] = []
        
        for i in 0..<count {
            var copy = self
            let current = copy.remove(at: i)
            
            if overlaps(left: current, rights: copy) {
                results.append((copy, currentlyRemoved + 1))
                return (copy, currentlyRemoved + 1)
            }
        }
        
        if results.isEmpty {
            return (self, currentlyRemoved)
        }
        
        _ = results.sorted{ $0.currentlyRemoved < $1.currentlyRemoved }
        return results.first!
    }
}
