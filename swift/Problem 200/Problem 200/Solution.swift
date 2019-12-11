//
//  Solution.swift
//  Problem 200
//
//  Created by sebastien FOCK CHOW THO on 2019-12-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Interval = (start: Int, end: Int)

extension Array where Element == Interval {
    
    func smallestStabingSet() -> Interval {
        
        let mins = self.map{ $0.end }.sorted()
        let maxs = self.map{ $0.start }.sorted()
        
        return (mins.first!, maxs.last!)
    }
}
