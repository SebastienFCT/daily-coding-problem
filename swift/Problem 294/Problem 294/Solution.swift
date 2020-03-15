//
//  Solution.swift
//  Problem 294
//
//  Created by sebastien FOCK CHOW THO on 2020-03-14.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Runner {
    
    var elevations: [Int : Int]
    var paths: [(itinerary: (from: Int, to: Int), distance: Int)]
    
    func shortestPathAscendingAndThenDescending() ->  (locations: [Int], distance: Int)? {
        
        let candidates = allPaths(currentLocations: ([0], 0), ascending: true)
        let sorted = candidates.sorted{ $0.distance < $1.distance }
        
        return sorted.first
    }
    
    private func allPaths(currentLocations: (locations: [Int], distance: Int), ascending: Bool = true) -> [(locations: [Int], distance: Int)] {
        
        var result: [(locations: [Int], distance: Int)] = []
        
        var current = currentLocations
        
        // End condition
        
        if current.locations.count > 1 && current.locations.last! == 0 {
            return [currentLocations]
        }
        
        if current.locations.last == nil {
            current.locations.append(0)
            current.distance = 0
        }
        
        let currentLocation = current.locations.last!

        
        for path in paths {
            guard elevations.keys.contains(path.itinerary.from) else {
                fatalError("elevations are missing location \(path.itinerary.from)")
            }
            
            guard elevations.keys.contains(path.itinerary.to) else {
                fatalError("elevations are missing location \(path.itinerary.to)")
            }
            
            if path.itinerary.from == currentLocation {
                if elevations[path.itinerary.to]! > elevations[path.itinerary.from]! {
                    
                    if !ascending {
                        continue
                    }
                    
                    var copy = current
                    copy.locations.append(path.itinerary.to)
                    copy.distance += path.distance
                    
                    result.append(contentsOf: allPaths(currentLocations: copy, ascending: true))
                } else {
                    
                    var copy = current
                    copy.locations.append(path.itinerary.to)
                    copy.distance += path.distance
                    
                    result.append(contentsOf: allPaths(currentLocations: copy, ascending: false))
                }
            }
        }
        
        return result
    }
}
