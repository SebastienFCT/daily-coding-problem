//
//  Solution.swift
//  Problem 18
//
//  Created by sebastien FOCK CHOW THO on 2019-06-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    func getMaxValueOfSubarray(ofLength length: Int) -> [Int] {
        guard length <= self.count else {
            fatalError("length can't be greater than the array length")
        }
        
        var result: [Int] = []
        
        if length == self.count {
            return [self.max() ?? 0]
        }
        
        for i in 1...(self.count - (length - 1)) {
            let subarray = self[(i-1)...(i + length - 2)]
            
            let value = subarray.max() ?? 0
            result.append(value)
        }
        
        return result
    }
}
