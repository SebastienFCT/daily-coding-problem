//
//  Solution.swift
//  Problem 216
//
//  Created by sebastien FOCK CHOW THO on 2019-12-27.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func romanToDecimal() -> Int {
        
        let romanEncoding: [Character: Int] = [
            "M": 1000,
            "D": 500,
            "C": 100,
            "L": 50,
            "X": 10,
            "V": 5,
            "I": 1
        ]
        
        let filtered = self.filter { !"MDCLXVI".contains($0) }
        
        guard filtered.isEmpty else {
            fatalError("Input invalid")
        }
        
        var result = 0
        var maxValue = 0
        
        for i in stride(from: count-1, through: 0, by: -1) {
            
            let character = Array(self)[i]
            guard let value = romanEncoding[character] else {
                fatalError("Could not decode \(character)")
            }
            
            maxValue = max(value, maxValue)
            result += value == maxValue ? value : -value
        }
        
        return result
    }
}
