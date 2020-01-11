//
//  Solution.swift
//  Problem 58
//
//  Created by sebastien FOCK CHOW THO on 2019-07-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    func findIndex(_ value: Int) -> (subArray: [Int], index: Int)? {
        if let first = first, let last = last {
            if first == value {
                return (self, 0)
            }
            
            if last == value {
                return (self, count-1)
            }
            
            if first == last {
                return nil
            }
            
            let mid = self[count/2]
            
            if mid == value {
                return (self, count/2)
            }
            
            var sub: [Int]
            
            if (first > value && value < mid) || (first < value && value > mid) {
                sub = Array(self.prefix(count/2))
                return sub.findIndex(value)
            } else {
                sub = Array(self.suffix(count/2))
                if var subResult = sub.findIndex(value) {
                    let copy = subResult
                    subResult.index = count/2 + copy.index
                    return subResult
                }
            }
        }
        
        return nil
    }
}
