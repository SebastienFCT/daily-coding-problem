//
//  Solution.swift
//  Problem 157
//
//  Created by sebastien FOCK CHOW THO on 2019-10-29.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    func isPalindrome() -> Bool {
        var characterSet: Set<Character> = Set()
        
        for character in self {
            if characterSet.contains(character) {
                characterSet.remove(character)
            } else {
                characterSet.insert(character)
            }
        }
        
        if self.count % 2 == 0 {
            return characterSet.isEmpty
        } else {
            return characterSet.count == 1
        }
    }
}
