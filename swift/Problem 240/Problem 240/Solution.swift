//
//  Solution.swift
//  Problem 240
//
//  Created by sebastien FOCK CHOW THO on 2020-01-20.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Couples {
    
    var people: [Int]
    
    func rearrange() -> (count: Int, result: [Int]) {
        
        var copy = people
        var current: Int? = nil
        var totalSwap = 0
        
        var i = 0
        
        while i < copy.count-1 {
            if current == nil {
                current = copy[i]
            }
            
            for j in i+1..<copy.count {
                if copy[j] == copy[i] {
                    if j == i+1 {
                        
                        i += 2
                        current = nil
                        
                        break
                    } else {
                        let tmp = copy[i+1]
                        copy[i+1] = current!
                        copy[j] = tmp
                        
                        totalSwap += 1
                        i += 2
                        current = nil
                        
                        break
                    }
                }
            }
        }
        
        return (totalSwap, copy)
    }
}
