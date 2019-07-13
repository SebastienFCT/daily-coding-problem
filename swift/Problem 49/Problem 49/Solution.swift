//
//  Solution.swift
//  Problem 49
//
//  Created by sebastien FOCK CHOW THO on 2019-07-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    In this problem we need to find the maximum sub-array in one pass
 
    When the absolute value of a negative element is larger than the sum of its elements on the left, then it means that taking these elements would have a negative impact on the total sum
 
    We basically need to track our sum as we're going through the array and override it any time the next value is  greater than the sum of it with the previous elements
 
 */
//extension Array where Element == Int {
//    func findLargestConsecutiveSum() -> Int {
//        var sum = 0
//
//        for element in self {
//            sum += element
//            if element > sum {
//                sum = element
//            }
//        }
//
//        return sum
//    }
//}
/**
 
    After testing, we can see that we need to ignore negative value. We can just apply the previous logic and return 0 if the final result is negative
 
 */
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
