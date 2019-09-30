//
//  Solution.swift
//  Problem 35
//
//  Created by sebastien FOCK CHOW THO on 2019-06-29.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Character {
    
    mutating func RGB() -> [Character] {
        var leftIndex = 0
        var rightIndex = self.count-1
        
        for i in 0..<self.count {
            if i > rightIndex {
                break
            }
            
            let element = self[i]
            
            switch element {
            case "R":
                self[i] = Character("\(self[leftIndex])")
                self[leftIndex] = "R"
                leftIndex += 1
            case "B":
                self[i] = Character("\(self[leftIndex])")
                self[rightIndex] = "B"
                rightIndex -= 1
            default:
                break
            }
        }
        
        return self
    }
}
