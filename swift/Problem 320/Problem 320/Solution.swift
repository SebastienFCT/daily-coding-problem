//
//  Solution.swift
//  Problem 320
//
//  Created by sebastien FOCK CHOW THO on 2020-04-09.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func smallestWindowWithAllDistinctCharacters() -> Int {
        
        var uniqueCharacters: Set<Character> = Set()
        
        for char in self {
            uniqueCharacters.insert(char)
        }
        
        if uniqueCharacters.count == count {
            return count
        }
        
        var candidates: [Int] = []
        
        for i in 0..<count-uniqueCharacters.count {
            
            for j in i+1..<count {
                
                let current = Set(self[i...j])
                
                if (uniqueCharacters.subtracting(current).count == 0) {
                    candidates.append(current.count)
                    break
                }
            }
        }
        
        let sorted = candidates.sorted{ $0 < $1 }
        
        return sorted.first ?? count
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
