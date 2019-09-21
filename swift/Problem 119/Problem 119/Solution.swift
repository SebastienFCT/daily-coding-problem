//
//  Solution.swift
//  Problem 119
//
//  Created by sebastien FOCK CHOW THO on 2019-09-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Interval {
    var min: Int
    var max: Int

    func values() -> [Int] {
        var result: [Int] = []

        for i in min...max {
            result.append(i)
        }

        return result
    }

}

extension Array where Element == Interval {
    func sortedByMaxValues() -> [Interval] {
        return self.sorted{ $0.max < $1.max }
    }
    
    func mininumCover() -> [Int] {
        var result: [Int] = []
        
        var sorted = self.sortedByMaxValues()
        
        while !sorted.isEmpty {
            let current = sorted.removeFirst()
            result.append(current.max)
            
            for i in stride(from: sorted.count-1, to: -1, by: -1) {
                let element = sorted[i]
                
                if element.values().contains(current.max) {
                    sorted.remove(at: i)
                }
            }
        }
        
        return result
    }
}
