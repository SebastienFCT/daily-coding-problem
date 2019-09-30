//
//  Solution.swift
//  Problem 34
//
//  Created by sebastien FOCK CHOW THO on 2019-06-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    func isPalindrome() -> Bool {
        
        let mid = self.count / 2
        
        return String(self.prefix(mid)) == String(self.suffix(mid).reversed())
    }
    
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

