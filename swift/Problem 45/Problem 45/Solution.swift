//
//  Solution.swift
//  Problem 45
//
//  Created by sebastien FOCK CHOW THO on 2019-07-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct SigmaChallenge {
    
    static func rand5() -> Int {
        return Int.random(in: 1...5)
    }
    
    static func rand7() -> Int {
        return (rand5() + rand5() + rand5() + rand5() + rand5() + rand5() + rand5()) / 7
    }
}

extension SigmaChallenge {
    static func rand7b() -> Int {
        
        let random = (SigmaChallenge.rand5() * 5) - 5 + SigmaChallenge.rand5()
        
        if random >= 22 {
            return SigmaChallenge.rand7b()
        }
        
        switch random {
        case 1..<4:
            return 1
        case 4..<7:
            return 2
        case 7..<10:
            return 3
        case 10..<13:
            return 4
        case 13..<16:
            return 5
        case 16..<19:
            return 6
        default:
            return 7
        }
    }
}
