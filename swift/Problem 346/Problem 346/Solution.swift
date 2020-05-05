//
//  Solution.swift
//  Problem 346
//
//  Created by sebastien FOCK CHOW THO on 2020-05-05.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Flight = (from: String, to: String, price: Int)

struct AirbnbFlights {
    
    let flights: [Flight]
    
    func cheapestTrip(from: String, to: String, withMaxConnection: Int) -> Int {
        
        
        let candidates = find(current: [], from: from, to: to, remainingConnections: withMaxConnection, visited: [])
        
        let mapped = candidates.map({ $0.reduce(0) { $0 + $1.price } })
        let sorted = mapped.sorted{ $0 < $1 }
        
        return sorted.first ?? 0
    }
    
    private func find(current: [Flight], from: String, to: String, remainingConnections: Int, visited: [String]) -> [[Flight]] {
        
        if remainingConnections == 0 {
            return [current]
        }
        
        var candidates: [[Flight]] = []
        
        if current.isEmpty {
            for flight in flights {
                if flight.from == from && flight.to == to {
                    candidates.append([flight])
                } else if flight.from == from {
                    candidates.append(contentsOf: find(current: [flight], from: from, to: to, remainingConnections: remainingConnections-1, visited: [flight.to]))
                }
            }
            
            return candidates
        }
        
        let lastLocation = current.last!.to
        
        for flight in flights {
            if visited.contains(flight.to) { continue }
            
            if flight.from == lastLocation && flight.to == to {
                var trip = current
                trip.append(flight)
                candidates.append(trip)
            } else if flight.from == lastLocation {
                var newCurrent = current
                newCurrent.append(flight)
                var newVisited = visited
                newVisited.append(flight.to)
                candidates.append(contentsOf: find(current: newCurrent, from: from, to: to, remainingConnections: remainingConnections-1, visited: newVisited))
            }
        }
        
        return candidates
    }
}
