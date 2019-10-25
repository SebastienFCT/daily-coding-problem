//
//  Solution.swift
//  Problem 152
//
//  Created by sebastien FOCK CHOW THO on 2019-10-24.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Triplebyte {
    var values: [Int]
    var percentages: [Double]
    
    func random() -> Int {
        let randomValue = Double.random(in: 0...1)
        
        var cumul: Double = 0
        
        for i in 0..<values.count {
            cumul += percentages[i]
            
            if randomValue <= cumul {
                return values[i]
            }
        }
        
        return values.last!
    }
}
