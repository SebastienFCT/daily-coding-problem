//
//  Solution.swift
//  Problem 291
//
//  Created by sebastien FOCK CHOW THO on 2020-03-11.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Hurricane {
    
    var population: [Int]
    
    func minBoats(withMaxWeightPerPerson maxWeight: Int) -> Int {
        
        var sorted = population.sorted{ $0 > $1 }
        
        var pairs: [(left: Int, right: Int?)] = []
        
        while !sorted.isEmpty {
            if sorted.count == 1 {
                let left = sorted.removeFirst()
                pairs.append((left, nil))
                break
            }
            
            let left = sorted.removeFirst()
            let right = sorted.removeLast()
            
            if left + right <= maxWeight {
                pairs.append((left, right))
                break
            }
            
            // Here we assume that all boat can hold any single person from the population, we can catch this earlier otherwise
            pairs.append((left, nil))
            
            sorted.append(right)
        }
        
        return pairs.count
    }
}
