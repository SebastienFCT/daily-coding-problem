//
//  Solution.swift
//  Problem 12
//
//  Created by sebastien FOCK CHOW THO on 2019-06-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

func howManyWaysToReach(_ goal: Int, withStepUnits stepUnits: [Int]) -> Int {
    var total = 0
    
    for unit in stepUnits {
        if goal - unit == 0 {
            total += 1
        } else if goal - unit < 0 {
            total += 0
        } else {
            total += howManyWaysToReach(goal - unit, withStepUnits: stepUnits)
        }
    }
    
    return total
}
