//
//  Solution.swift
//  Problem 33
//
//  Created by sebastien FOCK CHOW THO on 2019-06-27.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {

    func binarySearchInsertIndex(_ element: Int) -> Int {
        var leftBoundary = 0
        var rightBoundary = self.count-1
        
        while leftBoundary <= rightBoundary {
            let mid = (leftBoundary + rightBoundary) / 2
            
            if self[mid] > element {
                rightBoundary = mid - 1
            } else if self[mid] < element {
                leftBoundary = mid + 1
            } else {
                return mid
            }
        }
        
        return leftBoundary
    }
    
    func spawnProgressiveMedians() -> [Double] {
        var result: [Double] = []
        
        var orderedArray: [Int] = []
        
        for element in self {
            orderedArray.insert(element, at: orderedArray.binarySearchInsertIndex(element))
            
            if orderedArray.count % 2 == 0 {
                let median = Double(orderedArray[orderedArray.count/2-1] + orderedArray[orderedArray.count/2]) / 2
                result.append(median)
                print(median)
            } else {
                let median = Double(orderedArray[orderedArray.count/2])
                result.append(median)
                print(median)
            }
        }
        
        return result
    }
}
