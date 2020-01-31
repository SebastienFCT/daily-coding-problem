//
//  Solution.swift
//  Problem 250
//
//  Created by sebastien FOCK CHOW THO on 2020-01-30.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Cryptarithmetic {
    
    var dictionary: [Character : Int]
    
    func solve3words(word1: String, word2: String, word3: String) {
        
        let set = [word1, word2, word3].toCharacterSet()
        let array = Array(set)
        
        if array.count > 10 {
            fatalError("too many characters")
        }
        
        var digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        for i in 0...9 {
            var copyCharacters = array
            var copyDigits = digits
            var dictionary: [Character : Int] = [:]
            
            while copyCharacters.isEmpty {
                
            }
        }
        for character in array {
            var dictionary: [Character : Int] = [:]
            
            var copy = inputs
            for i in 0..<copy.count {
                var anotherCopy = copy
            }
            
        }
    }
    
    func test(set: CharacterSet) -> Bool {
        var word1Val: Int = 0
        var word2Val: Int = 0
        var word3Val: Int = 0
        
        return word1Val + word2Val == word3Val
    }
}

extension Array where Element == Int {
    
}

extension Array where Element == String {
    
    func toCharacterSet() -> Set<Character> {
        
        var result: Set<Character> = Set()
        
        for word in self {
            for character in word {
                result.insert(character)
            }
        }
        
        return result
    }
}

extension String {
    func wordToInt(dictionary: [Character : Int]) -> Int {
        
        var result = 0
        
        for i in stride(from: count-1, through: 0, by: -1) {
            let character = self[i]
            
            result += (dictionary[character]! * (count - i))
        }
        
        return 0
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
    subscript(range: CountablePartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
