//
//  Solution.swift
//  Problem 77
//
//  Created by sebastien FOCK CHOW THO on 2019-08-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    - First I would define a structure for my interval
    - Then I would right a function that check if an interval is overlapping another one
    - Finally I would build a custom function reducing my array based on the previous utility
 
 */
struct Interval {
    var start: Int
    var end: Int
    
    func isOverlapping(interval: Interval) -> Bool {
        return start >= interval.start && end <= interval.end
    }
}

extension Array where Element == Interval {
    mutating func reduceOverlapping() -> [Interval] {

        for i in 0..<count {
            // Loop through the elements
            let element = self[i]
            
            // Create a copy of the initial array without the current element
            var copy = self
            copy.remove(at: i)
            
            // If the element is overlapping any other interval, remove it and re-iterate
            for interval in copy {
                if element.isOverlapping(interval: interval) {
                    remove(at: i)
                    return reduceOverlapping()
                }
            }
        }
        
        return self
    }
}

/**
 
    Utility functions to switch from the tuple syntax to intervals
 
 */
func tuplesToIntervals(input: [(start: Int, end: Int)]) -> [Interval] {
    var result: [Interval] = []
    
    for tuple in input {
        result.append(Interval(start: tuple.start, end: tuple.end))
    }
    
    return result
}

func intervalsToTuples(input: [(Interval)]) -> [(start: Int, end: Int)] {
    var result: [(start: Int, end: Int)] = []
    
    for interval in input {
        result.append((start: interval.start, end: interval.end))
    }
    
    return result
}
