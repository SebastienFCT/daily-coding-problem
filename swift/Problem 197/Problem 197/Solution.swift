//
//  Solution.swift
//  Problem 197
//
//  Created by sebastien FOCK CHOW THO on 2019-12-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    mutating func rotate(k: Int) {
        for _ in 1...k {
            rotate()
        }
    }
    
    mutating private func rotate() {
        for i in stride(from: count-1, to: -1, by: -1) {
            
            if i == 0 {
                let tmp = self[i]
                self[i] = self[count-1]
                self[count-1] = tmp
            } else {
                let tmp = self[i-1]
                self[i-1] = self[i]
                self[i] = tmp
            }
            
        }
    }
}
