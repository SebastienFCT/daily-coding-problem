//
//  Solution.swift
//  Problem 66
//
//  Created by sebastien FOCK CHOW THO on 2019-07-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    What I would try to do for this exercise is determine what is the actual probability table of my toss_biased function
 
    Let's do two things:
 
    - Write a really dummy function that returns a random value between 0 and 1 with a non equally reparted probability
    - Write a function that decrypt the probability of my function (by approximation)
 
 */

struct Square {
    static func toss_biased() -> Bool {
        let randomFloat = Float.random(in: 0..<1)
        
        if randomFloat > 0.2 {
            return true
        } else {
            return false
        }
    }
    
    func determineProbabilityTable(repetition: Int) -> [Bool: Float] {
        var table: [Bool: Int] = [ true: 0, false: 0]
        
        for _ in 0..<repetition {
            let random = Square.toss_biased()
            table[random]! += 1
        }
        
        return [true: Float(table[true]!) / Float(repetition), false: Float(table[false]!) / Float(repetition)]
    }
}

/**
 
    Now, given that I have a table of probability for my coin, I need to get a random value between 0 and 1
 
    Let's imagine that we toss 2 coins, there is four possibilities:
 
    - true, true
    - true, false
    - false, true
    - false, false
 
    Since our coin is biased, true and true doesn't have the same probability as false and false, however there is as much chances to draw true and false that there are to draw false and true (the chances are equal to chanceToGetHead * chanceToGetTail VS chanceToGetTail * chanceToGetHead)
 
    So following this logic, we could simple toss 2 coins and expect either one of them. If we don't get it, we just ignore and try again
 
 */
extension Square {
    static func toss_unbiased() -> Bool {
        var result: Bool? = nil
        
        while result == nil {
            let tosses = (toss_biased(), toss_biased())
            
            switch tosses {
            case (true, false):
                result = true
            case (false, true):
                result = false
            default:
                break
            }
        }
        
        return result!
    }
}
