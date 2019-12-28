//
//  Solution.swift
//  Problem 217
//
//  Created by sebastien FOCK CHOW THO on 2019-12-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Int {
    
    func nextSparse() -> Int {
        
        var binary = toBinary()
        
        while !binary.isSparse() {
            let next = binary.binaryToInt() + 1
            binary = next.toBinary()
        }
        
        return binary.binaryToInt()
    }
}

extension Array where Element == Int {
    
    
    
    func isSparse() -> Bool {
        
        for i in 0..<count {
            
            if self[i] == 1 {
                if i > 0 {
                    if self[i-1] == 1 {
                        return false
                    }
                }
                
                if i < count-1 {
                    if self[i+1] == 1 {
                        return false
                    }
                }
            }
        }
        
        return true
    }
}

// Binary converters

extension Int {
    func toBinary() -> [Int] {
        
        var result: [Int] = []
        
        let binary = String(self, radix: 2)
        
        for item in binary {
            result.append(Int(String(item))!)
        }
        
        return result
    }
}

extension Array where Element == Int {
    
    func binaryToInt() -> Int {
        
        var binary = ""
        
        forEach { (item) in
            binary += String(item)
        }
        
        guard let value = Int(binary, radix: 2) else {
            fatalError("Could not convert binary")
        }
        
        return value
    }
}
