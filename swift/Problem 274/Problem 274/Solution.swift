//
//  Solution.swift
//  Problem 274
//
//  Created by sebastien FOCK CHOW THO on 2020-02-24.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func eval() -> Int? {
        
        var result: Int? = nil
        var operation: Character? = nil
        
        for character in self {
            
            if character.isNumber {
                if let op = operation {
                    switch op {
                    case "-":
                        if result != nil {
                            result! -= Int(String(character))!
                        } else {
                            result = -Int(String(character))!
                        }
                    default:
                        if result != nil {
                            result! += Int(String(character))!
                        } else {
                            result = Int(String(character))!
                        }
                    }
                    
                    operation = nil
                } else {
                    result = Int(String(character))!
                }
            } else {
                operation = character
            }
        }
     
        return result
    }
}
