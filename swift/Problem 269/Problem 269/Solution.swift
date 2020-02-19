//
//  Solution.swift
//  Problem 269
//
//  Created by sebastien FOCK CHOW THO on 2020-02-18.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Character {
    
    func dominos() -> [Character] {
        
        guard (filter{ $0 == "." && $0 == "L" && $0 == "R" }.count == 0) else {
            fatalError("Invalid input")
        }
        
        var result = self
        var changeCount = 0
        
        for i in 0..<count {
            
            let current = self[i]
            
            if current != "." { continue }
            
            if (i == 0 && self[i+1] == "." || i == 0 && self[i+1] == "R") { continue }
            
            if (i == count-1 && self[i-1] == "." || i == count-1 && self[i-1] == "L") { continue }
            
            if (i == 0 && self[i+1] == "L") {
                result[i] = "L"
                changeCount += 1
                continue
            }
            
            if (i == count-1 && self[i-1] == "R") {
                result[i] = "R"
                changeCount += 1
                continue
            }
            
            switch (self[i-1], self[i+1]) {
                case ("L", "L"):
                    result[i] = "L"
                    changeCount += 1
                    continue
                case ("R", "R"):
                    result[i] = "R"
                    changeCount += 1
                    continue
                case ("R", "."):
                    result[i] = "R"
                    changeCount += 1
                    continue
                case (".", "L"):
                    result[i] = "L"
                    changeCount += 1
                    continue
                default:
                    continue
            }
            
        }
        
        return changeCount == 0 ? result : result.dominos()
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
