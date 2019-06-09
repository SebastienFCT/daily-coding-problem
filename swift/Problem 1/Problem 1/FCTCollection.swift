//
//  FCTCollection.swift
//  Problem 1
//
//  Created by sebastien FOCK CHOW THO on 2019-06-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    func hasPairForSum(sum k: Int) -> Bool {
        
        var set: Set<Int> = Set()
        
        for element in self {
            if set.contains(where: { (value) -> Bool in
                k - element == value
            }) {
                return true
            }
            
            set.insert(element)
        }
        
        return false
    }
}
