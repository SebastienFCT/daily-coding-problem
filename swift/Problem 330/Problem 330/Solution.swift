//
//  SOlution.swift
//  Problem 330
//
//  Created by sebastien FOCK CHOW THO on 2020-04-19.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

// (¬c OR b) AND (b OR c) AND (¬b OR c) AND (¬c OR ¬a)

extension String {
    
    func solve2Cnf() -> [Character: Bool]? {
        
        var result: [Character: Bool] = [:]
        
        var variables: [Character] = []
        
        var copy = self
        copy = copy.replacingOccurrences(of: "¬", with: "!")
        copy = copy.replacingOccurrences(of: "AND", with: "&")
        copy = copy.replacingOccurrences(of: "OR", with: "|")
        
        for character in copy {
            if character == " " || character == "(" || character == ")" || character == "&" || character == "|" || character == "!" {
                continue
            }
            
            if !variables.contains(character) {
                variables.append(character)
            }
        }
        
        let map = Array(repeating: true, count: variables.count)
        
        for candidate in allBoolCombinations(current: [], remaining: map.count) {
            
            var attempt = copy
            
            for i in 0..<variables.count {
                attempt = attempt.replacingOccurrences(of: String(variables[i]), with: candidate[i] ? "true" : "false")
                result[variables[i]] = candidate[i]
            }
            
            attempt = attempt.replacingOccurrences(of: "!true", with: "false")
            attempt = attempt.replacingOccurrences(of: "!false", with: "true")
            
            let expression = NSExpression(format: attempt)
            if let evaluation = expression.expressionValue(with: nil, context: nil) as? NSNumber, evaluation.boolValue {

                return result
            }
            
            
        }
        
        return nil
    }
}

func allBoolCombinations(current: [Bool], remaining: Int) -> [[Bool]] {
    
    if remaining == 1 {
        var copy1 = current
        copy1.append(true)
        
        var copy2 = current
        copy2.append(false)
        
        var result: [[Bool]] = []
        result.append(copy1)
        result.append(copy2)
        
        return result
    }
    
    var result: [[Bool]] = []
    var copy = current
    copy.append(true)
    
    result.append(contentsOf: allBoolCombinations(current: copy, remaining: remaining-1))
    
    copy = current
    copy.append(false)
    
    result.append(contentsOf: allBoolCombinations(current: copy, remaining: remaining-1))
    
    return result
}
