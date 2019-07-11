//
//  Solution.swift
//  Problem 47
//
//  Created by sebastien FOCK CHOW THO on 2019-07-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    In this problem we need to find the minimum and largest value in an array of integers
 
    We don't need to loop through the array twice, we can just store the maximum value and the minimum value in separate variable and update them as we're scanning the stock values
 
 */
extension Array where Element == Int {
    func findLargestDifferenceFAILED() -> Int {
        guard self.count > 0 else {
            return 0
        }
        
        var min = self.first!
        var max = self.first!
        
        for element in self {
            if min > element {
                min = element
            }
            
            if max < element {
                max = element
            }
        }
        
        return (max - min > 0) ? max - min : 0
    }
}
/**
 
    Ok after testing, I've seen what I forgot to take into consideration:
 
    You need to buy the stock **before** you sell it (even though it was clearly mentioned in the exercise, I assume this was simple and skipped the first minutes analysing...)
 
    How do we fix this?
 
    What if we start from the end of our array, grab the largest value and look at the largest gap we can have with any of value before it?
 
    First we write a function that find the largest gap in a sub array based on the last value (this is basically finding the smallest value in the array)
 
 */
extension Array where Element == Int {
    func maximumGap() -> Int {
        guard self.count > 2 else {
            return 0
        }
        
        var min = self.first!
        
        // We skip the first item already set as the minimum and the last item as it's the item we're running the logic against
        for i in 1..<self.count-1 {
            let element = self[i]
            
            if element < min {
                min = element
            }
        }
        
        return (last! - min) > 0 ? last! - min : 0
    }
}
/**
 
    Ok this works, now we just have to loop through the array and check the maximum gap for each value starting from the end.
 
 */
extension Array where Element == Int {
    func findLargestDifference() -> Int {
        guard count > 2 else {
            return 0
        }
        
        var copy = self
        copy.removeLast()
        
        return Swift.max(maximumGap(), copy.maximumGap())
    }
}
