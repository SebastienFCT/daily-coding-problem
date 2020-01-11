//
//  Solution.swift
//  Problem 230
//
//  Created by sebastien FOCK CHOW THO on 2020-01-10.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct GoldmanSachsProblems {
    
    func minimumDropsForOptimalFloorInWorstCase(numberOfEggs N: Int, numberOfFloors k: Int) -> Int {
        
        var count = k
        var remainingEggs = N
        
        while remainingEggs > 1 {
            count /= 2
            remainingEggs -= 1
        }
        
        return count
    }
    
}
