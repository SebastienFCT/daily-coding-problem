//
//  Solution.swift
//  Problem 209
//
//  Created by sebastien FOCK CHOW THO on 2019-12-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == String {
    
    func longestCommonSubsequence() -> String {
        
        let candidates = nextCommon(current: "")
        let sorted = candidates.sorted{ $0.commonChars.count > $1.commonChars.count }
        
        return sorted.first?.commonChars ?? ""
    }
    
    func cleanNonCommon() -> [String] {
        
        var result: [String] = []
        
        for i in 0..<count {
            let word = self[i]
            var newWord = ""
            
            for character in word {
                for j in 0..<count {
                    if j != i && self[j].contains(character) {
                        newWord += "\(character)"
                        break
                    }
                }
            }
            
            result.append(newWord)
        }
        
        return result
    }
    
    func nextCommon(current: String) -> [(commonChars: String, rest: [String])] {
        
        var candidates: [(commonChars: String, rest: [String])] = []
        
        let first = self[0]
        
        for i in 0..<first.count {
            let character = first[i]
            let commonChars = "\(current)\(character)"
            var rest: [String] = []
            rest.append(first[(i+1)...].string)
            
            for j in 1..<count {
                let other = self[j]
                if !other.contains(character) {
                    break
                } else {
                    for k in 0..<other.count {
                        if other[k] == character {
                            rest.append(other[(k+1)...].string)
                            break
                        }
                    }
                }
                
                candidates.append(contentsOf: rest.nextCommon(current: commonChars))
            }
        }
        
        if candidates.isEmpty {
            return [(current, [])]
        }
        
        return candidates
    }
}

extension StringProtocol {
    subscript(_ offset: Int)                     -> Element     { self[index(startIndex, offsetBy: offset)] }
    subscript(_ range: Range<Int>)               -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
    subscript(_ range: ClosedRange<Int>)         -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
    subscript(_ range: PartialRangeThrough<Int>) -> SubSequence { prefix(range.upperBound.advanced(by: 1)) }
    subscript(_ range: PartialRangeUpTo<Int>)    -> SubSequence { prefix(range.upperBound) }
    subscript(_ range: PartialRangeFrom<Int>)    -> SubSequence { suffix(Swift.max(0, count-range.lowerBound)) }
}

extension LosslessStringConvertible {
    var string: String { .init(self) }
}

extension BidirectionalCollection {
    subscript(safe offset: Int) -> Element? {
        guard !isEmpty, let i = index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex)) else { return nil }
        return self[i]
    }
}

