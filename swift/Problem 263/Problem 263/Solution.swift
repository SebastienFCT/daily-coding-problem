//
//  Solution.swift
//  Problem 263
//
//  Created by sebastien FOCK CHOW THO on 2020-02-12.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func areValidSentences() -> Bool {
        
        guard count > 2,  first!.isUppercase else {
            return false
        }
        
        let last = self.last!
        
        guard ["!", "?", "."].contains(last) else {
            return false
        }
        
        var previous = first!
        var current = self[1]
        
        if !((current.isLetter && current.isLowercase) || (current == " ")) {
            return false
        }
        
        for i in 2..<count {
            print("currnet: \(self[i])")
            previous = current
            current = self[i]
            
            switch previous {
            case " ":
                if [" ", "!", "?", "."].contains(current) { return false }
            case "?", "!", ".":
                if current.isLowercase { return false }
                if !current.isLetter { return false }
            default:
                break
            }
        }
        
        return true
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
