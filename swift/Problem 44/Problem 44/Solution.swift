//
//  Solution.swift
//  Problem 44
//
//  Created by sebastien FOCK CHOW THO on 2019-07-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    mutating func countOutOfOrder() -> Int {
        guard count > 0 else {
            fatalError("array can't be empty")
        }
        
        var count = 0
        var newArray: [Int] = []
        
        let first = self.removeFirst()
        newArray.append(first)
        
        while !self.isEmpty {
            let next = self.removeFirst()
            
            for i in 1...newArray.count {
                if newArray[newArray.count-i] > next {
                    count += 1
                    
                    if i >= newArray.count {
                        newArray.insert(next, at: newArray.count-i)
                    }
                } else {
                    newArray.insert(next, at: newArray.count-i+1)
                    break
                }
            }
            
        }
        
        return count
    }
}
