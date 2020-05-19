//
//  Solution.swift
//  Problem 360
//
//  Created by sebastien FOCK CHOW THO on 2020-05-19.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Int> {
    
    func spotifySorting() -> [Int] {
        
        var result: [Int] = []
        
        var copy = self
        
        var stop = false
        
        while !stop {
            
            var next: Int? = nil
            
            for i in 0..<copy.count {
                next = copy[i].first!
                
                for j in 0..<copy.count {
                    if j == i { continue }
                    
                    if copy[j].contains(next!) && copy[j].first != next! {
                        next = nil
                        break
                    }
                }
                
                if next != nil { break }
            }
            
            result.append(next!)
            
            copy = copy.map({ $0.filter{ $0 != next! } })
            copy = copy.filter{ !$0.isEmpty }
            
            next = nil
            
            if copy.isEmpty {
                stop = true
            }
        }
        
        return result
    }
}
