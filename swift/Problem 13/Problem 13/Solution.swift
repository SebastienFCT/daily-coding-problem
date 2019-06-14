//
//  Solution.swift
//  Problem 13
//
//  Created by sebastien FOCK CHOW THO on 2019-06-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    func findLargestSubstringWithMaximumDistinctCharacter(_ distinctCharacters: Int) -> String {
        var result = ""
        
        for i in 0...(self.count - 1) {
            let evaluation = String(self.suffix(self.count - i)).substringWith(distinctCharacters)
            
            if evaluation.count > result.count {
                result = evaluation
            }
        }
        
        return result
    }
    
    func substringWith(_ maximumDistinctCharacters: Int) -> String {
        var reference: Set<Character> = Set()
        var result: String = ""
        
        for char in self {
            reference.insert(char)
            
            if reference.count > maximumDistinctCharacters {
                return result
            }
            
            result += String(char)
        }
        
        return result
    }
}
