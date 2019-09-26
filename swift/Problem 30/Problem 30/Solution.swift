//
//  Solution.swift
//  Problem 30
//
//  Created by sebastien FOCK CHOW THO on 2019-06-24.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    func findDeepestValley() -> (subArray: [Int], leftBoundaryIndex: Int, rightBoundaryIndex: Int) {
        var enumeratedAndSorted = self.enumerated().sorted{ $0.element > $1.element }
        
        let boundaries = enumeratedAndSorted[0...1].sorted{ $0.offset < $1.offset }
        
        return (Array(self[boundaries[0].offset...boundaries[1].offset]), boundaries[0].offset, boundaries[1].offset)
    }
    
    func fill() -> (totalUnits: Int, maxHeight: Int) {
        let maxHeight = self.reduce(0, {$0 > $1 ? $0 : $1})
        let boundaryMaxHeight = Swift.min(self[0], self[self.count-1])
        var totalDrops = 0
        
        for element in self {
            if boundaryMaxHeight > element {
                totalDrops += boundaryMaxHeight - element
            }
        }
        
        return (totalDrops, maxHeight)
    }
    
    mutating func rain() -> Int {
        var count = 0
        
        while self.count != 1 {
            let valley = self.findDeepestValley()
            let fillValley = valley.subArray.fill()
            count += fillValley.totalUnits
            
            print(valley)
            print("adding \(fillValley.totalUnits)")
            
            if valley.leftBoundaryIndex == 0 && valley.rightBoundaryIndex == self.count-1 {
               return count
            }
            
            if valley.rightBoundaryIndex == 0 {
                self = Array(self[0...valley.leftBoundaryIndex-1]) + [fillValley.maxHeight]
                continue
            }
            
            if valley.leftBoundaryIndex == 0 {
                self = [fillValley.maxHeight] + Array(self[valley.rightBoundaryIndex+1...self.count-1])
                continue
            }
            
            self = Array(self[0...valley.leftBoundaryIndex-1]) + [fillValley.maxHeight] + Array(self[valley.rightBoundaryIndex+1...self.count-1])
        }
        
        return count
    }
}
