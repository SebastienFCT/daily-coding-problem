//
//  Solution.swift
//  Problem 42
//
//  Created by sebastien FOCK CHOW THO on 2019-07-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    // The function tries to find an element that is equals to the sum `forSum`
    // If it doesn't find one, it adds the element to a list of sum element already tested and tries with the next element
    func subset(forSum: Int, andList: [Int]) -> [Int]? {
        
        // Each element is a potential combination
        for i in 0..<self.count {
            // We create a copy that we can mutate
            var copy = self
            
            // We update our list of elements
            var newList = andList
            newList.append(copy[i])
            
            // We substract the element to the expected sum, if it works we return, otherwise the sum is being updated
            let newSum = forSum - copy[i]
            if newSum == 0 {
                return newList
            }
            
            copy.remove(at: i)
            
            // We re-iterate with the new sum and the new lists
            if let solution = copy.subset(forSum: newSum, andList: newList) {
                return solution
            }
        }
        
        return nil
    }
}
