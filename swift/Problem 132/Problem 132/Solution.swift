//
//  Solution.swift
//  Problem 132
//
//  Created by sebastien FOCK CHOW THO on 2019-10-04.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct HitCounter {
    var hits: [Double]
    var limit: Int

    mutating func record(timestamp: Double) {
        hits.append(timestamp)
        
        if hits.count > limit {
            hits.removeFirst()
        }
    }
    
    func total() -> Int {
        return hits.count
    }
    
    func range(lower: Double, upper: Double) -> Int {
        return hits.filter{ $0 > lower && $0 < upper }.count
    }
}
