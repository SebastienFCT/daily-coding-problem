//
//  Solution.swift
//  Problem 361
//
//  Created by sebastien FOCK CHOW THO on 2020-05-20.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

// Solution found at https://github.com/vineetjohn/daily-coding-problem/blob/master/solutions/problem_361.py
// While I understand what the code does, I'm having a hard time understand how it works...

struct Mastermind {
    var guesses: [String: Int]
    
    func solvable() -> Bool {
        
        for i in 0..<1000000 {
            var code = String(i)
            let array = Array(repeating: "0", count: 6-code.count)
            let arrayValue: String = array.reduce(""){ "\($0)\($1)" }

            code = "\(arrayValue)\(code)"

            var success = UInt8(exactly: NSNumber(booleanLiteral: true))!

            for (pair, value) in guesses {
                success = success & UInt8(exactly: NSNumber(booleanLiteral: matchGuess(code: code, guess: pair, matches: value)))!
            }
            
            if Bool(exactly: NSNumber(value: success)) == true { return true }
        }
        
        return false
    }
    
    private func matchGuess(code: String, guess: String, matches: Int) -> Bool {
        var count = 0
        let max = min(code.count, guess.count)
        
        for i in 0..<max {
            if code[i] == guess[i] {
                count += 1
            }
        }
        
        return count == matches
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
