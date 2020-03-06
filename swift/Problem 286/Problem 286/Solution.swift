//
//  Solution.swift
//  Problem 286
//
//  Created by sebastien FOCK CHOW THO on 2020-03-06.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Building = (left: Int, right: Int, height: Int)
typealias Skyline = (location: Int, height: Int)

struct City {
    
    var buildings: [Building]
    
    func skyline() -> [Skyline] {
        
        var result: [Skyline] = []
        
        guard buildings.count > 0 else {
            return result
        }
        
        let min = buildings.map{ $0.left }.sorted{ $0 < $1 }.first!
        let max = buildings.map{ $0.right }.sorted{ $0 > $1 }.first!
        
        var heights: [Int] = []
        
        for i in min...max {
            
            let filtered = buildings.filter{ $0.left <= i && $0.right >= i }
            let sorted = filtered.sorted{ $0.height > $1.height }
            
            heights.append(sorted.first?.height ?? 0)
        }
        
        var currentSkyline = (0, heights.first!)
        
        result.append(currentSkyline)
        
        for i in 1..<heights.count {
            if heights[i] != currentSkyline.1 {
                
                if heights[i] < currentSkyline.1 {
                    currentSkyline = (i-1, heights[i])
                } else {
                    currentSkyline = (i, heights[i])
                }
                
                result.append(currentSkyline)
            }
        }
        
        result.append((heights.count-1, 0))
        
        return result
    }
    
}
