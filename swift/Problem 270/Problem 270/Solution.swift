//
//  Solution.swift
//  Problem 270
//
//  Created by sebastien FOCK CHOW THO on 2020-02-19.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Edge = (from: Int, to: Int, time: Int)

struct Network {
    
    var length: Int
    
    func shortestPropagationTime(forEdges edges: [Edge]) -> Int? {
        
        var current: [Bool] = [true]
        
        for _ in 1..<length {
            current.append(false)
        }
        
        let candidates = propagationtimes(current: current, last: 0, count: 0, edges: edges)
        let sorted = candidates.sorted{ $0 < $1 }
        
        return sorted.first
    }
    
    private func propagationtimes(current: [Bool], last: Int, count: Int, edges: [Edge]) -> [Int] {
        
        var result: [Int] = []
        
        for i in 0..<edges.count {
            let edge = edges[i]
            
            if edge.from == last {
                if edge.to == length-1 {
                    result.append(count + edge.time)
                } else {
                    var copyCurrent = current
                    
                    if edge.to >= 0 && edge.to < length {
                        copyCurrent[edge.to] = true
                    }
                    var copyLast = last
                    copyLast = edge.to
                    var copyCount = count
                    copyCount += edge.time
                    var copyEdges = edges
                    copyEdges.remove(at: i)
                    
                    result.append(contentsOf: propagationtimes(current: copyCurrent, last: copyLast, count: copyCount, edges: copyEdges))
                }
            }
        }
        
        return result
        
    }
}
