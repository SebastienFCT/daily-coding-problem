//
//  Solution.swift
//  Problem 121
//
//  Created by sebastien FOCK CHOW THO on 2019-09-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    func isPalindrome() -> Bool {
        return String(self.prefix(count / 2)) == String(self.suffix(count / 2).reversed())
    }
    
    func canBuildPalindrome(maxDeletion k: Int) -> Bool {
        if self.isPalindrome() {
            return true
        }
        
        guard k > 0 else {
            return false
        }
        
        for i in 0..<count {
            let remaining = "\(String(self.prefix(i)))\(String(self.suffix(count-i-1)))"
            
            if remaining.canBuildPalindrome(maxDeletion: k-1) {
                return true
            }
        }
        
        return false
    }
}
