//
//  Solution.swift
//  Problem 229
//
//  Created by sebastien FOCK CHOW THO on 2020-01-09.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct SnakesAndLadders {
    var snakes: [Int: Int]
    var ladders: [Int: Int]
    
    func optimalPath() -> [Int] {
        
        let candidates = next(positions: [0])
        let sorted = candidates.sorted{ $0.count < $1.count }
        
        return sorted.first!
    }
    
    func next(positions: [Int]) -> [[Int]] {
        
        var result: [[Int]] = []
        
        let lastPosition = positions.last!
        
        if lastPosition == 100 {
            return [positions]
        }
        
        if lastPosition >= 94 {
            var copyPositions = positions
            copyPositions.append(100)
            return [copyPositions]
        }
        
        for i in 1...6 {
            var copyPositions = positions
            var newPosition = lastPosition + i
            
            if i < 6 && !ladders.keys.contains(newPosition) && !snakes.keys.contains(newPosition) {
                continue
            }
            
            if copyPositions.contains(newPosition) {
                continue
            } else {
                copyPositions.append(newPosition)
            }
            
            if snakes.keys.contains(newPosition) {
                newPosition = snakes[newPosition]!
                
                if copyPositions.contains(newPosition) {
                    continue
                } else {
                    copyPositions.append(newPosition)
                    
                    if newPosition == 100 {
                        return [copyPositions]
                    }
                }
            } else if ladders.keys.contains(newPosition) {
                newPosition = ladders[newPosition]!
                
                if copyPositions.contains(newPosition) {
                    continue
                } else {
                    copyPositions.append(newPosition)
                    
                    if newPosition == 100 {
                        return [copyPositions]
                    }
                }
            }
            
            result.append(contentsOf: next(positions: copyPositions))
        }
        
        return result
    }
}
