//
//  Solution.swift
//  Problem 250
//
//  Created by sebastien FOCK CHOW THO on 2020-01-30.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Cryptarithmetic {
    
    func solve3words(word1: String, word2: String, word3: String) -> [Character : Int]? {
        
        let set = [word1, word2, word3].toCharacterSet()
        let array = Array(set)
        
        if array.count > 10 {
            fatalError("too many characters")
        }
        
        let digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        for i in 0...9 {
            var copy = digits
            var map: [Int] = []
            
            map.append(copy.remove(at: i))
            
            for j in 0...8 {
                map.append(copy.remove(at: j))
                
                for k in 0...7 {
                    map.append(copy.remove(at: k))
                    
                    for l in 0...6 {
                        map.append(copy.remove(at: l))
                        
                        for m in 0...5 {
                            map.append(copy.remove(at: m))
                            
                            for n in 0...4 {
                                map.append(copy.remove(at: n))
                                
                                for o in 0...3 {
                                    map.append(copy.remove(at: o))
                                    
                                    for p in 0...2 {
                                        map.append(copy.remove(at: p))
                                        
                                        for q in 0...1 {
                                            map.append(copy.remove(at: q))
                                            map.append(copy.remove(at: 0))
                                            
                                            let dictionary = mapsToDictionary(characters: array, digits: map)
                                            if test(dictionary: dictionary, word1: word1, word2: word2, word3: word3) {
                                                return dictionary
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return nil
    }
    
    func mapsToDictionary(characters: [Character], digits: [Int]) -> [Character: Int] {
        var result: [Character : Int] = [:]
        
        for i in 0..<characters.count {
            result[characters[i]] = digits[i]
        }
        
        return result
    }
    
    func test(dictionary: [Character : Int], word1: String, word2: String, word3: String) -> Bool {
        let word1Val = word1.wordToInt(dictionary: dictionary)
        let word2Val = word2.wordToInt(dictionary: dictionary)
        let word3Val = word3.wordToInt(dictionary: dictionary)
        
        return word1Val + word2Val == word3Val
    }
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
