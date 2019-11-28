//
//  Solution.swift
//  Problem 186
//
//  Created by sebastien FOCK CHOW THO on 2019-11-27.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func pairWithSmallestDifference() -> (diff: Int, left: [Int], right: [Int]) {
        
        return pairWithMininmumDiff(currentIndex: count, left: [], right: [], currentTotal: 0, total: self.reduce(0, +))
    }
    
    private func pairWithMininmumDiff(currentIndex: Int, left: [Int], right: [Int], currentTotal: Int, total: Int) -> (diff: Int, left: [Int], right: [Int]) {
        
        if currentIndex == 0 {
            let diff = abs((total - currentTotal) - currentTotal)
            return (diff, left, right)
        }
        
        var newLeft = left
        newLeft.append(self[currentIndex-1])
        
        var newRight = right
        newRight.append(self[currentIndex-1])
        
        let leftChoice = pairWithMininmumDiff(currentIndex: currentIndex-1, left: newLeft, right: right, currentTotal: currentTotal + self[currentIndex-1], total: total)
        let rightChoice = pairWithMininmumDiff(currentIndex: currentIndex-1, left: left, right: newRight, currentTotal: currentTotal, total: total)
        
        return leftChoice.diff < rightChoice.diff ? leftChoice : rightChoice
    }
    
}
