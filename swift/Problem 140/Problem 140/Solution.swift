//
//  Solution.swift
//  Problem 140
//
//  Created by sebastien FOCK CHOW THO on 2019-10-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func findSingles() -> [Int] {
        var result: [Int] = []
        
        var dictionary: [Int: Int] = [:]
        
        for item in self {
            if dictionary.keys.contains(item) {
                dictionary[item]! += 1
            } else {
                dictionary[item] = 1
            }
        }
        
        for key in dictionary.keys {
            if dictionary[key] == 1 {
                result.append(key)
            }
        }
        
        return result
    }
}
