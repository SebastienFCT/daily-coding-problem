//
//  Solution.swift
//  Problem 51
//
//  Created by sebastien FOCK CHOW THO on 2019-07-15.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**

    In this problem, we're given with a function that returns a return number between 1 and k, let's add this quickly
 
 */
func rand(k: Int) -> Int {
    return Int.random(in: 1..<k)
}
/**
 
    We need a method for swapping elements of an array
 
 */
extension Array where Element == Int {
    mutating func swapElements(leftIndex: Int, rightIndex: Int) {
        let copy = self[leftIndex]
        
        self[leftIndex] = self[rightIndex]
        self[rightIndex] = copy
    }
}
/**
 
    Now we will loop through our array and everytime we will re-locate the card to another position
 
 */
extension Array where Element == Int {
    mutating func shuffleDeck() {
        for i in 0..<count {
            let randomValue = rand(k: self.count)
            
            swapElements(leftIndex: i, rightIndex: randomValue)
        }
    }
}
