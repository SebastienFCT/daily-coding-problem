//
//  Solution.swift
//  Problem 363
//
//  Created by sebastien FOCK CHOW THO on 2020-05-22.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

func add_substract(values: Int...) -> Int {
    
    var result = values[0]
    
    for i in 1..<values.count {
        if i % 2 == 0 {
            result -= values[i]
        } else {
            result += values[i]
        }
    }
    
    return result
}
