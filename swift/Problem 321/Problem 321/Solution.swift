//
//  Solution.swift
//  Problem 321
//
//  Created by sebastien FOCK CHOW THO on 2020-04-10.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Int {
    
    func lowestStepCountToOne() -> Int {
        
        if self == 2 {
            return 1
        }
        
        if self == 1 {
            return 0
        }
        
        var stepCount = 1
        
        let path1 = (self-1).lowestStepCountToOne()
        let option2 = self.highestDivider()
        
        if option2 != self {
            stepCount += Swift.min(path1, option2.lowestStepCountToOne())
        } else {
            stepCount += path1
        }
        
        return stepCount
    }
    
    private func highestDivider() -> Int {
        
        var higher = self
        
        for i in stride(from: self, through: 1, by: -1) {
            if self % i == 0 {
                let largest = Swift.max(i, self / i)
                
                if higher > largest {
                    higher = largest
                }
            }
        }
        
        return higher
    }
}
