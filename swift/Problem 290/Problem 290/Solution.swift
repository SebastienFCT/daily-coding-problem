//
//  Solution.swift
//  Problem 290
//
//  Created by sebastien FOCK CHOW THO on 2020-03-10.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

enum Quxe {
    case r
    case g
    case b
}

struct MisteriousIsland {
    
    var creatures: [Quxe]
    
    func reduce() -> [Quxe] {
        
        var copy = creatures
        
        var keepIterating = true
        while keepIterating {
            
            keepIterating = false
            
            if copy.count <= 1 {
                return copy
            }
            
            for i in 1..<copy.count {
                if copy[i-1] != copy[i] {
                    keepIterating = true
                    
                    let first = copy.remove(at: i-1)
                    let second = copy.remove(at: i-1)
                    
                    let merged = [Quxe.r, Quxe.g, Quxe.b].filter{ $0 != first && $0 != second }.first!
                    copy.insert(merged, at: i-1)
                    break
                }
            }
        }
        
        return copy
    }
}
