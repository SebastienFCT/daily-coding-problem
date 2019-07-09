//
//  Solution.swift
//  Problem 44
//
//  Created by sebastien FOCK CHOW THO on 2019-07-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    Here the first solution that comes to mind is a recursive function that check for each element how many elements are out of order
 
    This solution doesn't fit the requirement though (faster than O(N^2)).
 
    What if I try to build sets of out of order?
 
    [3, 1, 5, 2]
    [0, 1, 2, 3]
    sorted: [1, 2, 3, 5]
    sorted indexes: [1, 3, 0, 2]
 
    ... this doesn't lead me to anything.
 
    Another possibility is the following, imagine the array [3, 1, 5, 2]:
 
    - 3 is ok
    - 1 is not ok, out of order with 3
    - 5 is ok
    - 2 is not ok, out of order with 5 and 3
 
    If I were to keep track of my "out of order" count and I re-ordered my array in the same time
 
    - 3 -> ([3], +0=0)
    - 1 -> ([1,3], +1=1)
    - 5 -> ([1,3,5], +0=1)
    - 2 -> ([1,2,3,5], +2=3)
 
    This works for the previous example and seem to make sense, however I'm not 100% confident with incrementing the changes to the amount of indexes I have to move the item, let's write the function and test it
 
 */
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
