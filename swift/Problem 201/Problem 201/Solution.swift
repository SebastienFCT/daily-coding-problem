//
//  Solution.swift
//  Problem 201
//
//  Created by sebastien FOCK CHOW THO on 2019-12-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == [Int] {
    
    func maximumWeight() -> Int {
        
        guard count > 0 else {
            return 0
        }
        
        guard count > 1 else {
            return self[0][0]
        }
        
        let allCandidates = candidates(from: [self[0][0]], currentIndex: 0)
        let sorted = allCandidates.sorted{ $0.reduce(0, +) > $1.reduce(0, +) }
        
        return sorted.first!.reduce(0, +)
    }
    
    private func candidates(from: [Int], currentIndex: Int) -> [[Int]] {
        
        var result: [[Int]] = []
        
        if count == 1 {
            result.append(from)
            return result
        }
        
        var newArray: [[Int]] = []
        for i in 1..<count {
            newArray.append(self[i])
        }
        
        let leftValue = newArray[0][currentIndex]
        var newFrom = from
        newFrom.append(leftValue)
        
        result.append(contentsOf: newArray.candidates(from: newFrom, currentIndex: currentIndex))
        
        
        let rightValue = newArray[0][currentIndex+1]
        newFrom = from
        newFrom.append(rightValue)
        
        result.append(contentsOf: newArray.candidates(from: newFrom, currentIndex: currentIndex))
        
        return result
    }
}
