//
//  Solution.swift
//  Problem 34
//
//  Created by sebastien FOCK CHOW THO on 2019-06-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    We need to implement a code that identifies the largest possible symetric sub-part of a string
 
    Basically if I have "hello", it should return "llo". If I have "bob" it should return "bob"
 
    Let's start by building a function that tells if a string is a palindrome
 
 */
extension String {
    func isPalindrome() -> Bool {
        
        let mid = self.count / 2
        
        return String(self.prefix(mid)) == String(self.suffix(mid).reversed())
    }
}
/**
 
    Now we need a function that finds the smaller candidate for a palindrome, we basically return any actual palindrome with all the characters until either the end of the begining of the original string
 
    EDIT: we should also get the index of the substring so I return a tuple with its index instead
 
 */
extension String {
    func findLargestPartWithSymetry() -> [(String, Int)] {
        var copy = self
        var reversed = String(self.reversed())
        var index = 0
        
        while !copy.isEmpty {
            if copy.isPalindrome() && reversed.isPalindrome() {
                return [(copy, index), (reversed, 0)]
            }
            
            if copy.isPalindrome() {
                return [(copy, index)]
            }
            
            if reversed.isPalindrome() {
                return [(reversed, 0)]
            }
            
            _ = copy.removeFirst()
            _ = reversed.removeFirst()
            index += 1
        }
        
        return []
    }
}
/**
 
    Finally, we have to write the main function building the final string out of the sub-string
 
 */
extension String {
    func findPalindrome() -> String {
        let candidates = self.findLargestPartWithSymetry()
        
        return candidates.map{ buildPalindrome(base: self, part: $0) }.sorted{ $0 < $1 }.first ?? ""
    }
}

func buildPalindrome(base: String, part: (value: String, index: Int)) -> String {
    var result = base
    if part.index == 0 {
        let boundary = part.value.count % 2 == 0 ? part.value.count - 1 : part.value.count
        for i in boundary..<base.count {
            result.insert(base[base.index(base.startIndex, offsetBy: i)], at: result.startIndex)
        }
    } else {
        var i = part.index
        while i >= 0 {
            result.insert(base[base.index(base.startIndex, offsetBy: i)], at: result.endIndex)
            i -= 1
        }
    }
    
    return result
}

