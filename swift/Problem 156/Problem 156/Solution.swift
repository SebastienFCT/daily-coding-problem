//
//  Solution.swift
//  Problem 156
//
//  Created by sebastien FOCK CHOW THO on 2019-10-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct FacebookChallenge {
    
    func smallestNumberOfSquaredInteger(target: Int) -> Int? {
        
        return candidatesToMinNumberOfSquare(toReach: target).min()
    }
    
    private func candidatesToMinNumberOfSquare(toReach: Int) -> [Int] {
        
        var result: [Int] = []
        
        if toReach == 1 {
            result.append(1)
        } else {
            for i in 1...toReach/2 {
                if i * i == toReach {
                    result.append(i)
                } else if i * i < toReach {
                    if let min = candidatesToMinNumberOfSquare(toReach: toReach - (i * i)).min() {
                        result.append(1 + min)
                    }
                }
            }
        }
        
        return result
    }
}
