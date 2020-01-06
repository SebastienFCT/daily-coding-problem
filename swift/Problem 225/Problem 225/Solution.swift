//
//  Solution.swift
//  Problem 225
//
//  Created by sebastien FOCK CHOW THO on 2020-01-05.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func last(withInterval: Int) -> Int {
        
        var indexes: [Int] = []
        var lastIndex = 0
        
        while count > indexes.count {
            
            var pointer = lastIndex
            
            for _ in 0..<withInterval {
                
                pointer += 1
                if pointer == count {
                    pointer = 0
                }
                
                while indexes.contains(self[pointer]) {
                    pointer += 1
                    if pointer == count {
                        pointer = 0
                    }
                }
            }
            
            indexes.append(pointer)
            lastIndex = pointer
        }
        
        return lastIndex
    }
}
