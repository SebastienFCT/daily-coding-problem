//
//  Solution.swift
//  Problem 106
//
//  Created by sebastien FOCK CHOW THO on 2019-09-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func canHopToTheEnd() -> Bool {
        var currentIndex = 0
        
        while currentIndex < count {
            currentIndex += self[currentIndex]
            
            // Condition where we can't hop anymore
            if self[currentIndex] == 0 && currentIndex < count-1 {
                return false
            }
            
            // Reached the end of the array
            if currentIndex == count-1 {
                return true
            }
            
            // We went pass the end of the array
            if currentIndex >= count {
                return false
            }
        }
        
        return false
    }
}
