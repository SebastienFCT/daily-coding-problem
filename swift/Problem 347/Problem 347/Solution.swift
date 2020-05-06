//
//  Solution.swift
//  Problem 347
//
//  Created by sebastien FOCK CHOW THO on 2020-05-06.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

//aedcb, k=2
//adcbe
//dcbea
//cbead
//ceadb
//eadbc
//adbce
//abced
//bceda
//cedab
//edabc
//eabcd
//abcde

extension String {
    
    func lexicoMin(movingAnyOfTheFirsts: Int) -> String {
        
        let sortedValue = sorted()
        
        if movingAnyOfTheFirsts > 1 {
            return String(sortedValue)
        }
        
        guard let firstCharacter = sortedValue.first else {
            return ""
        }
        
        var indexesAndWords: [Int: String] = [:]
        
        for i in 0..<count {
            if self[i] == firstCharacter {
                
                var value = ""
                for j in i..<count {
                    value = "\(value)\(self[j])"
                }
                
                for j in 0..<i {
                    value = "\(value)\(self[j])"
                }
                
                indexesAndWords[i] = value
            }
        }
        
        let candidates = indexesAndWords.map({ $0.value })
        let sorted = candidates.sorted{ $0 < $1 }
        
        return sorted.first ?? ""
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
