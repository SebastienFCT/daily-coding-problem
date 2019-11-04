//
//  Solution.swift
//  Problem 163
//
//  Created by sebastien FOCK CHOW THO on 2019-11-04.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct RPN {
    var input: [Any]
    
    func evaluate() -> Int {
        
        var operands: [Int] = []
        
        for element in input {
            if let intValue = element as? Int {
                operands.append(intValue)
            } else {
                guard let characterValue = element as? String else {
                    fatalError("Input must be strings (aka character) or ints")
                }
                
                if let rightOperand = operands.popLast(), let leftOperand = operands.popLast() {
                    operands.append(calculate(left: leftOperand, right: rightOperand, operation: Character(characterValue)))
                }
            }
        }
        
        return operands.last ?? 0
    }
    
    func calculate(left: Int, right: Int, operation: Character) -> Int {
        switch operation {
            case "+": return left + right
            case "-": return left - right
            case "*": return left * right
            case "/": return left / right
            default: return 0
        }
    }
}
