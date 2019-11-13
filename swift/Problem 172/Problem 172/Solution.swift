//
//  Solution.swift
//  Problem 172
//
//  Created by sebastien FOCK CHOW THO on 2019-11-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == String {
    
    func indicesForCombinations(s: String) -> [Int] {
        var result: [Int] = []
        
        let combinations = allCombinations(previous: [])
        
        for word in combinations {
            if s.contains(word) {
                if let range = s.indexOf(substring: word) {
                    result.append(range.lowerBound)
                }
            }
        }
        
        return result
    }
    
    private func allCombinations(previous: [String]) -> [String] {
        var result: [String] = []
        
        if isEmpty {
            return previous
        }
        
        if previous.isEmpty {
            for i in 0..<count {
                let word = self[i]
                
                var newArray: [String] = []
                newArray.append(word)
                
                var remaining: [String] = []
                remaining.append(contentsOf: self.prefix(i))
                remaining.append(contentsOf: self.suffix(count-i-1))
                
                result.append(contentsOf: remaining.allCombinations(previous: newArray))
            }
        } else {
            for existing in previous {
                for i in 0..<count {
                    var copy = existing
                    copy += "\(self[i])"
                    
                    var newArray: [String] = []
                    newArray.append(copy)
                    
                    var remaining: [String] = []
                    remaining.append(contentsOf: self.prefix(i))
                    remaining.append(contentsOf: self.suffix(count-i-1))
                    
                    result.append(contentsOf: remaining.allCombinations(previous: newArray))
                }
            }
        }
        
        return result
    }
}

extension String {
    func indexOf(substring: String) -> NSRange? {
        if let range = range(of: substring) {
            let startPos = distance(from: startIndex, to: range.lowerBound)
            return NSMakeRange(startPos, substring.count)
        }
        
        return nil
    }
}
