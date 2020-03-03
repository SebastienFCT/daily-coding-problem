//
//  Solution.swift
//  Problem 283
//
//  Created by sebastien FOCK CHOW THO on 2020-03-03.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

// Adaptation of https://www.tutorialspoint.com/Ugly-Numbers

func regularNumbers(limit n: Int) -> [Int] {
    
    var result: [Int] = [1]
    
    var a = 2
    var aIncrement = 0
    var b = 3
    var bIncrement = 0
    var c = 5
    var cIncrement = 0
    
    for _ in 1..<n {
        
        let next = min(a, b, c)
        
        result.append(next)
        
        if result.last == a {
            aIncrement += 1
            a = 2 * result[aIncrement]
        }
        
        if result.last == b {
            bIncrement += 1
            b = 3 * result[bIncrement]
        }
        
        if result.last == c {
            cIncrement += 1
            c = 5 * result[cIncrement]
        }
    }
    
    return result
}
