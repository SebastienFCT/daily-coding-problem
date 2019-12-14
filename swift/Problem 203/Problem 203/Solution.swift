//
//  Solution.swift
//  Problem 203
//
//  Created by sebastien FOCK CHOW THO on 2019-12-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func minValue() -> Int {
        
        // 9, 10, 11, 1, 2, 3, 4, 5, 6, 7, 8
        
        var index = count / 2
        
        while true {
            if index == 0 || index == count-1 {
                return self[index]
            }
            
            if self[index+1] < self[index] {
                return self[index+1]
            }
            
            if self[index-1] > self[index] {
                return self[index-1]
            }
            
            let newIndex = index + (index / 2)
            
            if self[newIndex] < self[index] {
                index = newIndex
            } else {
                index = index / 2
            }
        }
    }
}
