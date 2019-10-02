//
//  Solution.swift
//  Problem 129
//
//  Created by sebastien FOCK CHOW THO on 2019-10-01.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Float {
    func findSquareRoot() -> Float {
        var current: Float = 1
        var limit: Float = self
        
        while current <= limit {
            let mid = (current + limit) / 2
            
            switch (mid * mid) {
            case self: return mid
            case let value where value < self: current = mid + 1
            default: limit = mid - 1
            }
        }
        
        return current
    }
}
