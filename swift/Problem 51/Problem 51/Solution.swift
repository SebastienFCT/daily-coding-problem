//
//  Solution.swift
//  Problem 51
//
//  Created by sebastien FOCK CHOW THO on 2019-07-15.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

func rand(k: Int) -> Int {
    return Int.random(in: 1..<k)
}

extension Array where Element == Int {
    mutating func swapElements(leftIndex: Int, rightIndex: Int) {
        let copy = self[leftIndex]
        
        self[leftIndex] = self[rightIndex]
        self[rightIndex] = copy
    }
    
    mutating func shuffleDeck() {
        for i in 0..<count {
            let randomValue = rand(k: self.count)
            
            swapElements(leftIndex: i, rightIndex: randomValue)
        }
    }
}
