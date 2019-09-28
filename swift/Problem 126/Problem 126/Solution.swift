//
//  Solution.swift
//  Problem 126
//
//  Created by sebastien FOCK CHOW THO on 2019-09-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    mutating func rotate(by k: Int) -> [Int] {
        for _ in 1...k {
            shiftElements()
        }
        
        return self
    }
    
    mutating private func shiftElements() {
        for i in 0..<count-1 {
            swapIndexes(left: i, right: i+1)
        }
    }
    
    mutating private func swapIndexes(left: Int, right: Int) {
        guard left <= count else {
            fatalError("left index out of bound")
        }
        
        guard right <= count else {
            fatalError("right index out of bound")
        }
        
        let tmp = self[left]
        self[left] = self[right]
        self[right] = tmp
    }
}
