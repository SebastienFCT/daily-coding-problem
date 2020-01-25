//
//  Solution.swift
//  Problem 245
//
//  Created by sebastien FOCK CHOW THO on 2020-01-25.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func minJumps() -> Int {
        
        guard count > 0 else {
            fatalError("invalid length.")
        }
        
        guard (filter{ $0 > 0 }.count) > 0 else {
            fatalError("all inputs must be positive.")
        }
        
        let candidates = next(current: 0)
        let sorted = candidates.sorted{ $0 < $1 }
        
        return sorted.first!
    }
    
    func next(current: Int) -> [Int] {
        
        var result: [Int] = []
        
        let max = self.first!
        
        if max >= count-1 {
            return [current+1]
        }
        
        if max == 0 {
            return []
        }
        
        for i in 1...max {
            result.append(contentsOf: Array(suffix(count-i)).next(current: current+1))
        }
        
        return result
    }
}
