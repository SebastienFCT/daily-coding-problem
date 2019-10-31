//
//  Solution.swift
//  Problem 159
//
//  Created by sebastien FOCK CHOW THO on 2019-10-31.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    func firstRecurringCharacter() -> Character? {
        
        var scanned: Set<Character> = Set()
        
        for character in self {            
            if scanned.contains(character) {
                return character
            }
            
            scanned.insert(character)
        }
        
        return nil
    }
}
