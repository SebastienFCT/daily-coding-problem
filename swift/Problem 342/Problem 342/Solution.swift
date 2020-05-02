//
//  Solution.swift
//  Problem 342
//
//  Created by sebastien FOCK CHOW THO on 2020-05-01.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias IntOperation = (Int, Int) -> Int

func fold(list: [Int], operation: IntOperation, initial: Int) -> Int {
    
    var result = initial
    
    for i in 0..<list.count {
        result = operation(result, list[i])
    }
    
    return result
    
}
