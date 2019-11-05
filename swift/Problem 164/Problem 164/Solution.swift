//
//  Solution.swift
//  Problem 164
//
//  Created by sebastien FOCK CHOW THO on 2019-11-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func pigeonhole() -> Int? {
        var set: Set<Int> = Set()
        
        for item in self {
            if set.contains(item) {
                return item
            }
            
            set.insert(item)
        }
        
        return nil
    }
    
}
