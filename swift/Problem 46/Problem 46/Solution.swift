//
//  Solution.swift
//  Problem 46
//
//  Created by sebastien FOCK CHOW THO on 2019-07-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func longestPalindrom() -> String? {
        let copy = self
        
        if copy.isPalindrom() {
            return copy
        }
        
        if let anyPalindrom = copy.anyPalindrome() {
            if anyPalindrom.count == copy.count - 1 {
                return anyPalindrom
            }
        }
        
        var left = copy
        left.removeFirst()
        var right = copy
        right.removeLast()
        
        switch (left.longestPalindrom(), right.longestPalindrom()) {
        case (nil, nil):
            return nil
        case (nil, _):
            return right.longestPalindrom()!
        case (_, nil):
            return left.longestPalindrom()!
        default:
            let leftPalindrom = left.longestPalindrom()!
            let rightPalindrom = right.longestPalindrom()!
            
            return leftPalindrom.count > rightPalindrom.count ? leftPalindrom : rightPalindrom
        }
    }
    
    func anyPalindrome() -> String? {
        if self.count <= 1 {
            return nil
        }
        
        if self.isPalindrom() {
            return self
        } else {
            var copy = self
            copy.removeFirst()
            copy.removeLast()
            
            return copy.anyPalindrome()
        }
    }
    
    func isPalindrom() -> Bool {
        var copy = self
        
        while !copy.isEmpty {
            if copy.count == 1 {
                return true
            }
            
            let first = copy.removeFirst()
            let last = copy.removeLast()
            
            if first != last {
                return false
            }
        }
        
        return true
    }
}
