//
//  Solution.swift
//  Problem 27
//
//  Created by sebastien FOCK CHOW THO on 2019-06-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {    
    mutating func isWellFormed3(forPairs pairs: Pairs) -> Bool {
        var openingBrackets: [Character] = []
        
        while !self.isEmpty {
            if let next = self.first {
                if pairs.isOpeningCharacter(next) {
                    openingBrackets.append(next)
                }
                
                if pairs.isClosingCharacter(next), let lastOpening = openingBrackets.last {
                    if pairs.matches(lhs: lastOpening, rhs: next) {
                        _ = openingBrackets.removeLast()
                    } else {
                        return false
                    }
                }
                
                self = String(self.dropFirst())
            }
        }
        
        if !openingBrackets.isEmpty {
            // some opening brackets didn't close
            return false
        }
        
        return true
    }
}

struct Pairs {
    var sets: [Pair]
    
    func matches(lhs: Character, rhs: Character) -> Bool {
        return sets.contains(where: { (pair) -> Bool in
            (pair.left == lhs && pair.right == rhs)
        })
    }
    
    func isOpeningCharacter(_ character: Character) -> Bool {
        for set in sets {
            if set.left == character {
                return true
            }
        }
        
        return false
    }
    
    func isClosingCharacter(_ character: Character) -> Bool {
        for set in sets {
            if set.right == character {
                return true
            }
        }
        
        return false
    }
}

struct Pair {
    var left: Character
    var right: Character
}
