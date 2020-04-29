//
//  Solution.swift
//  Problem 340
//
//  Created by sebastien FOCK CHOW THO on 2020-04-29.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias TwoDimensionalPoint = (Int, Int)

extension Array where Element == TwoDimensionalPoint {
    
    func closestPair() -> (left: TwoDimensionalPoint, right: TwoDimensionalPoint) {
        
        guard count > 1 else {
            fatalError("Not enough elements")
        }
        
        var left = self[0]
        var right = self[1]
        var distance = abs(left.0 - right.0) + abs(left.1 - right.1)
        
        for i in 0..<count-1 {
            for j in i+1..<count {
                
                let lCandidate = self[i]
                let rCandidate = self[j]
                
                let currentDistance = abs(lCandidate.0 - rCandidate.0) + abs(lCandidate.1 - rCandidate.1)
                
                if currentDistance < distance {
                    left = lCandidate
                    right = rCandidate
                    distance = currentDistance
                }
            }
        }
        
        return (left, right)
    }
}
