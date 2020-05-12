//
//  Solution.swift
//  Problem 353
//
//  Created by sebastien FOCK CHOW THO on 2020-05-12.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func maxArea() -> Int {
        
        if isEmpty {
            return 0
        }
        
        let candidate1 = self.min()! * count
        let candidate2 = Array(suffix(count-1)).maxArea()
        let candidate3 = Array(prefix(count-1)).maxArea()
        
        return Swift.max(candidate1, candidate2, candidate3)
    }
}
