//
//  Solution.swift
//  Problem 30
//
//  Created by sebastien FOCK CHOW THO on 2019-06-24.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
     Let's imagine that we had a really simple "valley" like [4,0,4], then it would be pretty straight forward, it would fill 4 units of water before overflowing on both left and right sides
 
     If one of the boudaries were smaller than the other: [2, 0, 4], then imagine the rain dropping from the highest point and slowly flowing on the other side, it would fill 2 units in the center and then flow out. We can actually apply this logic of dropping from the highest point in the previous example as well
 
     Now if we had something a little more complex like [2, 0, 3, 0, 5], it would still work as we would start from the last index and it would flow slowly to the left
 
     let's increase the complexity even more with [1, 0, 5, 0, 5, 0, 2], this time, we would have to find one of the highest point -the second index for example- we would then fill to the left -trapping 1 unit of water before overflowing- then we would apply the same rule to the right side, trapping another 5 units of water, 0 units, 2 units before overflowing.
 
     Another way to imagine it is to grab a sub-section of the array, the one with the highest boundaries [5, 0, 5] and fill it (5 units). We then replace the sub-section by a wall of the max height [1, 0, 5, 0, 2]. We apply this logic again until the whole map is filled.
 
     Let's start with the first part detecting the two largest walls and returning the sub-section. We will also keep track of the indexes from the initial array.
 
 */
extension Array where Element == Int {
    func findDeepestValley() -> (subArray: [Int], leftBoundaryIndex: Int, rightBoundaryIndex: Int) {
        var enumeratedAndSorted = self.enumerated().sorted{ $0.element > $1.element }
        
        let boundaries = enumeratedAndSorted[0...1].sorted{ $0.offset < $1.offset }
        
        return (Array(self[boundaries[0].offset...boundaries[1].offset]), boundaries[0].offset, boundaries[1].offset)
    }
}
/**
 
    Ok it works, let's now build the function that fills a valley:
 
 */
extension Array where Element == Int {
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
}
/**
 
     Now that we have these two functions, we can start iterating through the initial map.
 
     The logic is that:
 
     - We grab the first sub-array with highest boundaries and fill it
     - We replace the sub-section of the initial array with a wall of the maximum height (returned by the previous function)
     - We start again
     - The end condition should be when the initial map became a single wall
 
 */
extension Array where Element == Int {
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
