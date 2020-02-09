//
//  Solution.swift
//  Problem 259
//
//  Created by sebastien FOCK CHOW THO on 2020-02-08.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == String {
    
    func optimalStartForGhost() -> String? {
        
        let letters = self.map{ String($0.prefix(1)) }
        let uniqueLetters = Array(Set(letters))
        
        for letter in uniqueLetters {
            if !isWinningGhost(current: letter) {
                return letter
            }
        }
        
        return nil
    }
    
    func isWinningGhost(current: String) -> Bool {
        
        let sorted = self.filter{ $0.count >= current.count && String($0.prefix(current.count)) == current }
        let mapped = sorted.map{ $0.count }.filter{ $0 > current.count }
        
        if mapped.isEmpty {
            // this means that the current word actually reached a full word from the dictionary or reached a prefix that won't match any word
            return true
        }
        
        if !mapped.isEmpty {
            
            // if any of this condition leads optimally to the other user loosing, then it's a win
            for item in sorted {
                
                if (!isWinningGhost(current: String(item.prefix(current.count + 1)))) {
                    return true
                }
            }
        }
        
        // ortherwise it's a loose
        return false
    }
}
