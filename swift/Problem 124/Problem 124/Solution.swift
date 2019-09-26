//
//  Solution.swift
//  Problem 124
//
//  Created by sebastien FOCK CHOW THO on 2019-09-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

func approximateIterations(n totalCoins: Int, targetRemaining: Int, sampleSize: Int) -> Int {
    var successes: [Int] = []
    
    for _ in 0...sampleSize {
        var coins = Array(repeating: true, count: totalCoins)
        var attempts = 0
        
        while (coins.filter{ $0 }.count > 1) {
            for i in 0..<coins.count {
                if coins[i] {
                    if Bool.random() { coins[i] = false }
                }
            }
            
            attempts += 1
        }
        
        if (coins.filter{ $0 }.count == 1) {
            successes.append(attempts)
        }
    }
    
    return successes.reduce(0, +) / successes.count
}
