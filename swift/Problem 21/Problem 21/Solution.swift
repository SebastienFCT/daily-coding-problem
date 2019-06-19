//
//  Solution.swift
//  Problem 21
//
//  Created by sebastien FOCK CHOW THO on 2019-06-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == (Int, Int) {
    
    // We're trying to visualize when multiple courses are overlapping
    // When you look at a calendar, you see overlapping event sitting beside each others
    // So let's try to build an array where
    // - The index corresponds to the unit of time
    // - The value corresponds to how many courses are on this window
    // The array should start at the minimum possible unit of time and finish at the maximum possible unit. So index 0 = min([element0, element1])
    
    func minimumRoomRequired() -> Int {
        var result: [Int] = []
        
        let minUnit = (self.map{ $0.0 } + self.map{ $0.1 }).min() ?? 0
        let maxUnit = (self.map{ $0.0 } + self.map{ $0.1 }).max() ?? 0
        let range = maxUnit - minUnit
        
        guard range > 0 else {
            fatalError("range cannot be negative")
        }
        
        // self.map{ minUnit + i >= $0.0 && minUnit + i <= $0.1} returns an array of boolean if the class is during the current unit of time scanned
        // .filter{ $0 == true } will only keep the "true" (which means when a class is on a the unit of time)
        // .count give you how many class are on this same unit of time
        for i in 0...(range - minUnit) {
            result.append(self.map{ minUnit + i >= $0.0 && minUnit + i <= $0.1}.filter{ $0 == true }.count)
        }
        
        return result.max() ?? 0
    }
}
