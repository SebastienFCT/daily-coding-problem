//
//  Solution.swift
//  Problem 299
//
//  Created by sebastien FOCK CHOW THO on 2020-03-19.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct Hydro {
    
    var map: [(location: String, connections: [(location: String, cost: Int)])]
    
    func optimize() -> Int? {
        
        let candidates = optimize(currentLocations: ["plant"], currentCost: 0, remainingConnection: map)
        
        let sorted = candidates.sorted{ $0 < $1 }
        
        return sorted.first
    }
    
    private func optimize(currentLocations: [String], currentCost: Int, remainingConnection: [(location: String, connections: [(location: String, cost: Int)])]) -> [Int] {
        
        if remainingConnection.isEmpty {
            return [currentCost]
        }
        
        var allCosts: [Int] = []
        
        for i in 0..<remainingConnection.count {
            
            let next = remainingConnection[i]
            
            print("----------")
            print("currentLocations: \(currentLocations)")
            print("currentCost: \(currentCost)")
            print("next is \(next)")
            
            if !currentLocations.contains(next.location) {
                print("pass 1")
                continue
            }
            
            for j in 0..<next.connections.count {
                
                let candidate = next.connections[j]
                
                if currentLocations.contains(candidate.location) {
                    print("pass 2")
                    continue
                }
                
                var copy = remainingConnection
                var childCopy = next
                let removed = childCopy.connections.remove(at: j)
                
                var copyLocations = currentLocations
                copyLocations.append(removed.location)
                
                var copyCost = currentCost
                copyCost += removed.cost
                
                if childCopy.connections.isEmpty {
                    copy.remove(at: i)
                } else {
                    copy[i] = childCopy
                }
                
                allCosts.append(contentsOf: optimize(currentLocations: copyLocations, currentCost: copyCost, remainingConnection: copy))
            }
        }
        
        let filtered = allLocations.filter{ !currentLocations.contains($0) }
        if filtered.isEmpty {
            return [currentCost]
        }
        
        return allCosts
    }
    
    var allLocations: Set<String> {
        
        var set: Set<String> = Set()
        
        for location in map {
            
            if !set.contains(location.location) {
                set.insert(location.location)
            }
            
            for destination in location.connections {
                if !set.contains(destination.location) {
                    set.insert(destination.location)
                }
            }
        }
        
        return set
    }
}
