//
//  Solution.swift
//  Problem 138
//
//  Created by sebastien FOCK CHOW THO on 2019-10-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class CoinDistributor {
    static private let coins = Set([1, 5, 10, 25])
    
    static func withdraw(n: Int) -> [Int] {
        var remaining = n
        var result: [Int] = []
        
        for coinType in Array(coins).sorted(by: { $0 > $1 }) {
            while remaining >= coinType && remaining > 0 {
                remaining -= coinType
                result.append(coinType)
                
                if remaining == 0 {
                    return result
                }
            }
        }
        
        return result
    }
}
