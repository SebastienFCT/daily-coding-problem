//
//  Solution.swift
//  Problem 293
//
//  Created by sebastien FOCK CHOW THO on 2020-03-13.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Pyramid {
    
    var stones: [Int]
    
    func build() -> (cost: Int, result: [Int])? {
        
        let pyramids = allPyramids(forLength: stones.count)
        
        var candidates: [(cost: Int, result: [Int])] = []
        
        for pyramid in pyramids {
            if let optimized = optimize(forPyramid: pyramid) {
                candidates.append(optimized)
            }
        }
        
        let sorted = candidates.sorted{ $0.cost < $1.cost }
        
        return sorted.first
    }
    
    func allPyramids(forLength length: Int) -> [[Int]] {
        
        var result: [[Int]] = []
        
        if length % 2 == 0 {
            
            var currentLength = length
            
            while currentLength > 0 {
                
                var candidate: [Int] = []
                
                for i in 1...((currentLength)/2) {
                    candidate.append(i)
                }
                
                for i in stride(from: ((currentLength-1) / 2), through: 1, by: -1) {
                    candidate.append(i)
                }
                
                result.append(candidate)
                
                currentLength -= 2
            }
        }
        
        return result
    }
    
    func optimize(forPyramid pyramid: [Int]) -> (cost: Int, result: [Int])? {
        
        var candidates: [(cost: Int, result: [Int])] = []
        
        if pyramid.count == stones.count {
            
            var cost = 0
            
            for i in 0..<stones.count {
                if pyramid[i] > stones[i] {
                    return nil
                }
                    
                cost += stones[i] - pyramid[i]
            }
            
            return (cost, pyramid)
        }
        
        for i in 0...stones.count-pyramid.count {
            
            var cost = 0
            var candidate: [Int] = []
            
            if i > 0 {
                for k in 0..<i {
                    candidate.append(0)
                    cost += stones[k]
                }
            }
            
            var isPossible = true
            
            for j in i..<i+pyramid.count {
                
                if pyramid[j-i] > stones[j] {
                    isPossible = false
                    break
                }
                
                cost += stones[j] - pyramid[j-i]
            }
            
            if !isPossible {
                continue
            }
            
            candidate.append(contentsOf: pyramid)
            
            if i + pyramid.count < stones.count {
                for k in stride(from: stones.count-1, to: i, by: -1) {
                    candidate.append(0)
                    cost += stones[k]
                }
            }
            
            candidates.append((cost, candidate))
        }
        
        let sorted = candidates.sorted{ $0.cost < $1.cost }
        return sorted.first
    }
}
