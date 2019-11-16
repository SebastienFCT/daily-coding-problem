//
//  Solution.swift
//  Problem 175
//
//  Created by sebastien FOCK CHOW THO on 2019-11-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias MarkovState = (from: String, to: String, probability: Double)

extension Array where Element == MarkovState {
    
    func compute(start: String, steps: Int) -> [String: Int] {
        var result: [String: Int] = [:]
        var current = start
        var iterations = steps
        
        while iterations > 0 {
            if let nextValue = next(from: current) {
                if result.keys.contains(nextValue) {
                    result[nextValue]! += 1
                } else {
                    result[nextValue] = 1
                }
                
                current = nextValue
                iterations -= 1
            }
        }
        
        return result
    }
    
    func next(from: String) -> String? {
        
        var filtered = self.filter{ $0.from == from }
        
        for i in 1..<filtered.count {
            filtered[i].probability += filtered[i-1].probability
        }
        
        let rand = Double.random(in: 0...1)
        
        for item in filtered {
            if rand <= item.probability {
                
                return item.to
            }
        }
        
        return nil
    }
}
