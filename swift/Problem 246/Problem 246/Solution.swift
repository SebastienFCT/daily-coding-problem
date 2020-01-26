//
//  Solution.swift
//  Problem 246
//
//  Created by sebastien FOCK CHOW THO on 2020-01-26.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == String {
    
    func canCircle() -> Bool {
        
        guard count > 0 else {
            return true
        }
        
        guard count > 1 else {
            let first = self.first!
            
            return first.suffix(1) == first.prefix(1)
        }
        
        var copy = self
        let current = copy.remove(at: 0)
        
        return copy.canCircle(current: current, target: current)
    }
    
    func canCircle(current: String, target: String) -> Bool {
        
        if count == 1 {
            return self[0].suffix(1) == target.prefix(1)
        }
        
        for i in 0..<count {
            
            var copy = self
            
            if copy[i].prefix(1) == current.suffix(1) {
                let newCurrent = copy.remove(at: i)
                
                if (copy.canCircle(current: newCurrent, target: target)) {
                    return true
                }
            }
        }
        
        return false
    }
}
