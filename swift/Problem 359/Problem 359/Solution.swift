//
//  Solution.swift
//  Problem 359
//
//  Created by sebastien FOCK CHOW THO on 2020-05-18.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct NumFinder {
    
    var numWords: [String: Int] = [
        "one": 1,
        "two": 2,
        "three": 3,
        "four": 4,
        "five": 5,
        "six": 6,
        "seven": 7,
        "eight": 8,
        "nine": 9
    ]
    
    func solve(word: String) -> Int {
        
        var rep = word.charRepartition()
        var values: [Int] = []
        
        for (numWord, num) in numWords {
            
            let numWordRep = numWord.charRepartition()
            
            var iterate = true
            while iterate {
                
                if let next = rep.contains(dict: numWordRep) {
                    rep = next
                    values.append(num)
                } else {
                    iterate = false
                }
            }
            
        }
        
        values.sort()
        var result = 0
        var multiplier = 1
        
        for i in stride(from: values.count-1, through: 0, by: -1) {
            result += values[i] * multiplier
            multiplier *= 10
        }
        
        return result
    }
}

extension String {
    
    func charRepartition() -> [Character: Int] {
        
        var result: [Character: Int] = [:]
        
        for char in self {
            if result.keys.contains(char) {
                result[char]! += 1
            } else {
                result[char] = 1
            }
        }
        
        return result
    }
}

extension Dictionary where Key == Character, Value == Int {
    
    func contains(dict: [Character: Int]) -> [Character: Int]? {
        
        var copy = self
        
        for (key, value) in dict {
            
            if copy.keys.contains(key) {
                if copy[key]! >= value {
                    copy[key]! -= value
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
        
        return copy
    }
}
