//
//  Solution.swift
//  Problem 285
//
//  Created by sebastien FOCK CHOW THO on 2020-03-05.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Street {
    var buildingHeights: [Int]
    
    func countWithSunSet() -> Int {
        
        guard buildingHeights.count > 0 else {
            return 0
        }
        
        var count = 1
        var current = buildingHeights.last!
        
        guard buildingHeights.count > 2 else {
            return count
        }
        
        for i in stride(from: buildingHeights.count-1, through: 0, by: -1) {
            if buildingHeights[i] > current {
                count += 1
                current = buildingHeights[i]
            }
        }
        
        return count
    }
}
