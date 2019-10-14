//
//  Solution.swift
//  Problem 142
//
//  Created by sebastien FOCK CHOW THO on 2019-10-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func isBalanced() -> Bool {
        guard Set(self).isSubset(of: ["(", ")", "*"]) else {
            return false
        }
        
        let candidates = possibilities()
        
        for candidate in candidates {
            if candidate.balancedParentheses() {
                return true
            }
        }
        
        return false
    }
    
    private func balancedParentheses() -> Bool {
        var openingParentheses = 0
        
        for character in self {
            if character == "(" {
                openingParentheses += 1
            } else if character == ")" {
                guard openingParentheses > 0 else {
                    return false
                }
                
                openingParentheses -= 1
            }
        }
        
        return openingParentheses == 0
    }
    
    func possibilities() -> [String] {
        var result: [String] = [""]
        
        for character in self {
            if character == "*" {
                var copy: [String] = []
                
                for row in result {
                    copy.append(row)
                    copy.append(row + ["("])
                    copy.append(row + [")"])
                }
                
                result = copy
            } else {
                var copy: [String] = []
                
                for row in result {
                    copy.append(row + String(character))
                }
                
                result = copy
            }
        }
        
        return result
    }
}
