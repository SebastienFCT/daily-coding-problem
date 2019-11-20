//
//  Solution.swift
//  Problem 178
//
//  Created by sebastien FOCK CHOW THO on 2019-11-19.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Alice_s_Choice {
    
    static func averageForRoll(toValue: Int, followedBy: Int, sampleSize: Int) -> Int {
        var sums: [Int] = []
        
        for _ in 0...sampleSize {
            sums.append(roll(toValue: toValue, followedBy: followedBy))
        }
        
        return sums.reduce(0, +) / sampleSize
    }
    
    static func roll(toValue: Int, followedBy: Int) -> Int {
        
        var result = 1
        
        var previous = rollDice()
        var current = 0
        
        while !(previous == toValue && current == followedBy) {
            let new = rollDice()
            previous = current
            current = new
            result += 1
        }
        
        return result
    }
    
    static private func rollDice() -> Int {
        return Int.random(in: 1...6)
    }
}
