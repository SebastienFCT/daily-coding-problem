//
//  Solution.swift
//  Problem 74
//
//  Created by sebastien FOCK CHOW THO on 2019-08-07.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    To check if the value V is in the column C, I would do 2 things:
 
    - Check if V % C == 0
    - If yes, check if V / C <= N (if it's greater, then it's not in the table)

    I will apply this logic to a loop going through the columns.
 
 */
struct MultiplicationTable {
    var length: Int
    
    func countOccurence(value: Int) -> Int {
        var count = 0
        
        for i in stride(from: length, to: 1, by: -1) {
            if value % i == 0 && value / i <= length {
                count += 1
            }
        }
        
        return count
    }
}
