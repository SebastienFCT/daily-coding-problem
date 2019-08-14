//
//  Solution.swift
//  Problem 81
//
//  Created by sebastien FOCK CHOW THO on 2019-08-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    We can alias a dictionary of characters and array of character and it will represent our maps
 
    I will simply create a function that expects a current result and a string to decode and will render the possibilities when decoding the next character
 
    Calling recursively will do the job
 
 */
typealias YelpMapping = [Character : [Character]]

struct YelpDecoder {
    var map: YelpMapping
    
    func decode(message: String) -> [String] {
        return next(current: "", rest: message)
    }
    
    func next(current: String, rest: String) -> [String] {
        var candidates: [String] = []
        
        var copy = rest
        
        guard let nextChar = copy.first else {
            return []
        }
        
        copy.removeFirst()
        
        if copy.isEmpty {
            if let mapped = map[nextChar] {
                for character in mapped {
                    candidates.append("\(current)\(character)")
                }
            }
        } else {
            if let mapped = map[nextChar] {
                for character in mapped {
                    candidates.append(contentsOf: next(current: "\(current)\(character)", rest: copy))
                }
            }
        }
        
        
        return candidates
    }
}
