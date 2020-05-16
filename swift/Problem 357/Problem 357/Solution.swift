//
//  Solution.swift
//  Problem 357
//
//  Created by sebastien FOCK CHOW THO on 2020-05-16.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func treeDepth() -> Int {
        
        let stripped = filter{ $0 == "(" || $0 == ")" }
        
        var leftCount = 0
        var rightCount = 0
        
        for i in 0..<stripped.count {
            if stripped[i] == "(" {
                leftCount += 1
            } else {
                break
            }
        }
        
        for i in stride(from: stripped.count-1, through: 0, by: -1) {
            if stripped[i] == ")" {
                rightCount += 1
            } else {
                break
            }
        }
        
        return Swift.max(leftCount, rightCount) - 1
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
