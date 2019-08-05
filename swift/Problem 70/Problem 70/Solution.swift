//
//  Solution.swift
//  Problem 70
//
//  Created by sebastien FOCK CHOW THO on 2019-08-03.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    Obviously, the naive solution is to count the number, however this is not efficient at all especially as n groth. Still we could use this function to compare the next one
 
 */

struct Microsoft {
    func naivePerfect(n: Int) -> Int {
        var count = 0
        
        for i in 0..<Int.max {
            if i.sumOfDigits() == 10 {
                count += 1
            }
            
            if count == n {
                return i
            }
        }
        
        return 0
    }
}

extension Int {
    func sumOfDigits() -> Int {
        var result = 0
        var copy = self
        
        while copy > 0 {
            result += copy % 10
            copy /= 10
        }
        
        return result
    }
}

/**
 
     We want to find a pattern in the algorithm:
 
     - 19, 28, 37, ... the first part is obvious we're constantly adding 9 to the previous value
     - ..., 82, 91, 109, 118, 127, ... once the third digit appears, we're doing the same as previous (adding 9) with the exception that we skip 100.
 
     Let's try something else, if we split the number in digits:
 
     - 1 = [0][1][9]
     - 2 = [0][2][8]
     - 3 = [0][3][7]
     - ...
     - 8 = [0][8][2]
     - 9 = [0][9][1]
     - 10 = [1][0][9]
     - 11 = [1][1][8]
     - 12 = [1][2][7]
     - ...
     - 19 = [1][9][0]
     - 20 = [2][0][8]
 
     There seem to be a pattern here, it seems that F(X) = [X][10-sumofdigitofX], what happens for the next digit?
 
     - 90 = [9][0][1]
     - 91 = [9][1][0]
     - 92 = [1][0][2][7]
     - 93 = [1][0][3][6]
 
    Notice that:
    - it switches to 3 digits after 9 iterations
    - it switches to 4 digits after 90 iterations
 
    Does that mean that we switch to 5 digits after 900 iterations? We can test this using the naive approach
 
 
 */

extension Microsoft {
    func perfect(n: Int) -> Int {
        
        
        return 0
    }
}
