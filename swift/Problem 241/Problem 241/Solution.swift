//
//  Solution.swift
//  Problem 241
//
//  Created by sebastien FOCK CHOW THO on 2020-01-21.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Academia {
    
    func hIndex(papers n: Int, citations h: [Int]) -> Int {
        
        guard h.count == n else {
            fatalError("citation(s) missing for at least 1 paper")
        }
        
        for i in stride(from: n, through: 0, by: -1) {
            
            let filtered = h.filter{ $0 >= i }
            
            if filtered.count >= i {
                return i
            }
        }
        
        return 0
    }
}
