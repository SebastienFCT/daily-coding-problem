//
//  Solution.swift
//  Problem 181
//
//  Created by sebastien FOCK CHOW THO on 2019-11-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func splitInPalindromes() -> [String] {
        var copy = self
        var result: [String] = []
        
        while !copy.isEmpty {
            let next = copy.nextPalindrome()
            result.append(next)
            copy = String(copy.suffix(copy.count-next.count))
        }
        
        return result
    }
    
    private func nextPalindrome() -> String {
        var result = ""
        var current = ""
        
        for character in self {
            current = "\(current)\(character)"
            if current.isPalindrom() {
                result = current
            }
        }
        
        return result
    }
    
    private func isPalindrom() -> Bool {
        return prefix(count/2) == String(suffix(count/2).reversed())
    }
}
