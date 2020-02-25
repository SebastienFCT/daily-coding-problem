//
//  Solution.swift
//  Problem 275
//
//  Created by sebastien FOCK CHOW THO on 2020-02-24.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct LookAndSee {
    
    func get(n: Int) -> Int {
        
        var current = 1
        
        for _ in 2...n {
            current = next(current: current)
        }
        
        return current
    }
    
    private func next(current: Int) -> Int {
        
        var result = ""
        
        let value = "\(current)"
        
        var element: Int? = nil
        var count: Int? = nil
        
        for digit in value {
            
            let digitVal = Int(String(digit))
            
            if element == nil {
                element = digitVal
                count = 1
                continue
            }
            
            if element == digitVal {
                count! += 1
                continue
            }
            
            result += "\(count!)\(element!)"
            element = digitVal
            count = 1
        }
        
        if element != nil {
            result += "\(count!)\(element!)"
        }
        
        return Int(result)!
    }
}
