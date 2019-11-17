//
//  Solution.swift
//  Problem 176
//
//  Created by sebastien FOCK CHOW THO on 2019-11-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func hasOneToOneCharacterMapping(with: String) -> Bool {
        
        var copy = self
        var map: [Character : Character] = [:]
        
        for i in 0..<count {
            let character = copy[copy.index(copy.startIndex, offsetBy: i)]
            
            if let value = map[character] {
                copy = copy.replaceAtIndex(i, value)
            } else {
                let value = with[with.index(with.startIndex, offsetBy: i)]
                map[character] = value
                copy = copy.replaceAtIndex(i, value)
            }
        }
        
        return copy == with
    }
    
    func replaceAtIndex(_ index: Int, _ with: Character) -> String {
        var chars = Array(self)
        chars[index] = with
        let modifiedString = String(chars)
        
        return modifiedString
    }
}
