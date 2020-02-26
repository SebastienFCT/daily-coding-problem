//
//  Solution.swift
//  Problem 276
//
//  Created by sebastien FOCK CHOW THO on 2020-02-25.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func find(pattern: String) -> [Int]? {
        
        guard pattern.count <= count else {
            return nil
        }
        
        var result: [Int] = []
        
        for i in 0...count-pattern.count {
            if self[i...i+pattern.count-1] == pattern {
                result.append(i)
            }
        }
        
        return result.isEmpty ? nil : result
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
