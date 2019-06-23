//
//  Solution.swift
//  Problem 29
//
//  Created by sebastien FOCK CHOW THO on 2019-06-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    This challenge requires to implement two functions:
 
    - `Serialize()` will take a string as input and will apply the logic that replaces any repeating sequence of the same character by "XC" where X is the amount of time it's been repeated and C the character
    - `Deserialize()` will take a string as input and will replace any occurrence of "XC" with the string "CC...CC" corresponding to X times the character C
 
 */
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
}
/**
 
    For deserialize, the trick is to be able to extract integers value from each part.
 
    The hint we have is that each string only contains alphabetic characters, so we can split our input using any character in a set of alphetic characters
 
    First we will create our set of alphabetic characters
 
    Then we scan our input, putting together non alphabetic characters and combining them once we find an alphabetic character
 
 */
//extension String {
//    mutating func deserialize() -> String {
//        let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
//        var result = ""
//
//        var countString = ""
//
//        while !self.isEmpty {
//            let current = self.removeFirst()
//
//            // I had to google "how to find if a character is in a character set as the function `contains` was dealing with unicode scalars
//            if String(current).rangeOfCharacter(from: set) != nil {
//                result.append(String(repeating: current, count: Int(countString) ?? 0))
//                countString = ""
//            } else {
//                countString += String(current)
//            }
//        }
//
//        return result
//    }
//}
/**
 
    If I didn't have access to the convenient method `Int(description: String)`, I would create my own like this
 
 */
extension String {
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
