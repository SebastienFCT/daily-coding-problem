//
//  Solution.swift
//  Problem 192
//
//  Created by sebastien FOCK CHOW THO on 2019-12-03.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func canReachTheEndByWalkingAtMostEachIndex() -> Bool {
        
        guard let first = first else {
            return true
        }
        
        guard first > 0 else {
            return false
        }
        
        for i in 1...first {
            let next = Array(self.suffix(count-i))
            
            if next.canReachTheEndByWalkingAtMostEachIndex() {
                return true
            }
        }
        
        return false
    }
}
