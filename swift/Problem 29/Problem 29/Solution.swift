//
//  Solution.swift
//  Problem 29
//
//  Created by sebastien FOCK CHOW THO on 2019-06-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    mutating func serialize() -> String {
        var result = ""
        
        var memory: (character: Character, count: Int) = (self.removeFirst(), 1)
        
        while !self.isEmpty {
            let current = self.removeFirst()
            
            if current == memory.character {
                memory.count += 1
            } else {
                result += "\(memory.count)\(memory.character)"
                memory = (current, 1)
            }
        }
        
        result += "\(memory.count)\(memory.character)"
        
        return result
    }
    
    mutating func toInt() -> Int {
        let values: [Character : Int] = [
            "1" : 1,
            "2" : 2,
            "3" : 3,
            "4" : 4,
            "5" : 5,
            "6" : 6,
            "7" : 7,
            "8" : 8,
            "9" : 9,
            "0" : 0
        ]
        
        var result = 0
        
        let array = Array(self)
        let reversed = array.reversed()
        
        var factor = 1
        
        for element in reversed {
            result += factor * (values[element] ?? 0)
            factor += 1
        }
        
        return result
    }
    
    // Updated `deserialize`
    
    mutating func deserialize() -> String {
        let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var result = ""
        
        var countString = ""
        
        while !self.isEmpty {
            let current = self.removeFirst()
            
            if String(current).rangeOfCharacter(from: set) != nil {
                result.append(String(repeating: current, count: countString.toInt()))
                countString = ""
            } else {
                countString += String(current)
            }
        }
        
        return result
    }
}
