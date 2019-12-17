//
//  Solution.swift
//  Problem 205
//
//  Created by sebastien FOCK CHOW THO on 2019-12-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

// I didn't know what "next permutation in absolute number" meant and found the algorithm at https://www.geeksforgeeks.org/find-next-greater-number-set-digits/

extension Int {
    
    func toPart() -> [Int] {
        
        var result: [Int] = []
        
        let strVal = "\(self)"
        
        for char in strVal {
            if let value = Int(String(char)) {
                result.append(value)
            }
        }
        
        return result
    }
    
    func nextPermutationInAbsoluteOrder() -> Int? {
        return self.toPart().nextPermutationInAbsoluteOrder()?.toInt()
    }
}

extension Array where Element == Int {
    
    func toInt() -> Int {
        
        var result = 0
        
        for i in 0..<count {
            result += self[i] * Int(pow(10, Double(count-i-1)))
        }
        
        return result
    }
    
    func nextPermutationInAbsoluteOrder() -> [Int]? {
        
        for i in stride(from: count-2, through: 1, by: -1) {
            
            if self[i] < self[i+1] {
                
                var smallestValue: Int = self[i+1]
                var smallestIndex: Int = i+1
                
                for j in i+1...count-1 {
                    if self[j] < smallestValue && self[j] > self[i] {
                        smallestValue = self[j]
                        smallestIndex = j
                    }
                }
                
                var copy = self
                copy[i] = self[smallestIndex]
                copy[smallestIndex] = self[i]
                
                let left = copy.prefix(i+1)
                let right = copy.suffix(count-i-1)
                let sortedRight = right.sorted()
                
                return Array(left) + Array(sortedRight)
            }
        }
        
        return nil
    }
}
