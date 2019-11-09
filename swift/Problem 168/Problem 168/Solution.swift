//
//  Solution.swift
//  Problem 168
//
//  Created by sebastien FOCK CHOW THO on 2019-11-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Int> {
    
    mutating func rotate90() {
        
        let iteration = count / 2
        
        for i in 0..<iteration {
            
            let last = count - iteration
            
            for j in i..<last-i {
                print("i:\(i), j:\(j), last: \(last), iteration: \(iteration)")
                let temp = self[i][j]
                
                self[i][j] = self[last-j][i]
                self[last-j][i] = self[last-i][last-j]
                self[last-i][last-j] = self[j][last-i]
                self[j][last-i] = temp
            }
        }
        
    }
    
    mutating func flipFromDiagonal() {
        for i in 1..<count {
            for j in 0..<i {
                let temp = self[i][j]
                self[i][j] = self[j][i]
                self[j][i] = temp
            }
        }
    }
}
