//
//  Solution.swift
//  Problem 50
//
//  Created by sebastien FOCK CHOW THO on 2019-07-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: Double?
    var operation: Character?
    
    var left: Node?
    var right: Node?
    
    init(value: Double) {
        self.value = value
        self.operation = nil
    }
    
    init(operation: Character) {
        self.value = nil
        self.operation = operation
    }
    
    func getValue() -> Double {
        
        if let value = value {
            return value
        }
        
        if let operation = operation, let right = right, let left = left {
            switch operation {
            case "+":
                return left.getValue() + right.getValue()
            case "-":
                return left.getValue() - right.getValue()
            case "*":
                return left.getValue() * right.getValue()
            case "/":
                return left.getValue() / right.getValue()
            default:
                fatalError("operation unknown")
            }
        }
        
        fatalError("operation, left or right was missing")
    }
}
