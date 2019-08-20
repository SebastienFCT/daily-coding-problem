//
//  Solution.swift
//  Problem 86
//
//  Created by sebastien FOCK CHOW THO on 2019-08-19.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    I would write a function that goes through the string and keep track of each opening parenthese until it finds a closing one.
 
    Basically a FIFO structure
 
 */

extension String {
    
    func countNonValidParentheses() -> Int {
        var result = 0
        
        var openingCounting = 0
        
        for character in self {
            // If we have an opening parenthese then we add it to our stack
            if character == "(" {
                openingCounting += 1
                continue
            }
            
            // If we have closing parenthese before an opening one, it should be removed
            if character == ")" && openingCounting == 0 {
                result += 1
                continue
            }
            
            // If it's a closing parenthese and we have opening one to match with invalidate them
            if character == ")" {
                openingCounting -= 1
            }
        }
        
        // Finally, we just have to return the result + non closing ones
        return result + openingCounting
    }
}
