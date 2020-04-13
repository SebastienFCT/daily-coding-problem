//
//  Solution.swift
//  Problem 324
//
//  Created by sebastien FOCK CHOW THO on 2020-04-13.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Amazon {
    
    var mouses: [Int]
    var holes: [Int]
    
    func maxMoveCountToHide() -> Int {
        
        guard mouses.count == holes.count else {
            fatalError("mouses.count != holes.count")
        }
        
        let sortedMouses = mouses.sorted{ $0 < $1 }
        let sortedHoles = holes.sorted{ $0 < $1 }
        
        var largerDiff = 0
        
        for i in 0..<mouses.count {
            if abs(sortedMouses[i] - sortedHoles[i]) > largerDiff {
               largerDiff = abs(sortedMouses[i] - sortedHoles[i])
            }
        }
        
        return largerDiff
    }
}
