//
//  Solutions.swift
//  Problem 103
//
//  Created by sebastien FOCK CHOW THO on 2019-09-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    func subSequeceContaining(set: Set<Character>) -> String? {
        let toArray = self.toArrayOfCharacter()
        
        return toArray.subSequenceContaining(set: set).toString()
    }
    
    func toArrayOfCharacter() -> [Character] {
        var result: [Character] = []
        
        for char in self {
            result.append(char)
        }
        
        return result
    }
}

extension Array where Element == Character {
    
    func subSequenceContaining(set: Set<Character>) -> [Character] {
        var candidates: [[Character]] = []
        
        for i in 0..<count {
            var copy = Array(self.suffix(count-i))
            var copySet = set
            var current: [Character] = []
            
            while !copySet.isEmpty && !copy.isEmpty {
                let next = copy.removeFirst()
                current.append(next)
                
                if copySet.contains(next) {
                    copySet.remove(next)
                }
                
                if copySet.isEmpty {
                    candidates.append(current)
                }
            }
        }
        
        return candidates.sorted{ $0.count < $1.count }.first ?? []
    }
    
    func toString() -> String? {
        guard !self.isEmpty else {
            return nil
        }
        
        var result = ""
        
        for char in self {
            result += String(char)
        }
        
        return result
    }
}
