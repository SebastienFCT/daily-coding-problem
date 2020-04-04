//
//  Solution.swift
//  Problem 314
//
//  Created by sebastien FOCK CHOW THO on 2020-04-03.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Radio {
    
    var listeners: [Int]
    var towers: [Int]
    
    
    func minimumBoradcast() -> Int {
        
        var distances: [Int] = []
        
        for listener in listeners {
            
            var minDistance: Int? = nil
            
            for tower in towers {
                
                if minDistance == nil || abs(tower-listener) < minDistance! {
                    minDistance = abs(tower-listener)
                }
            }
                
            distances.append(minDistance!)
        }
        
        let sorted = distances.sorted{ $0 > $1 }
        
        return sorted.first!
    }
}
