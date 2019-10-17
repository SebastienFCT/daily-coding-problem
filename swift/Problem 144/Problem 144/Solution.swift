//
//  Solution.swift
//  Problem 144
//
//  Created by sebastien FOCK CHOW THO on 2019-10-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func indexOfNextLargest(ofIndex index: Int) -> Int? {
        
        let map = self.enumerated().sorted{ $0.element < $1.element }
        
        for item in map {
            if item.element > self[index] {
                return item.offset
            }
        }
        
        return nil
    }
}
