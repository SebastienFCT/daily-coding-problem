//
//  Solution.swift
//  Problem 41
//
//  Created by sebastien FOCK CHOW THO on 2019-07-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Itinerary {
    var value: String
    var destinations: [Itinerary]
    var isFinalDestination: Bool
    var finalArrival: String?

    init(value: String, destinations: [Itinerary], isFinalDestination: Bool = false, finalArrival: String? = nil) {
        self.value = value
        self.destinations = destinations
        self.isFinalDestination = isFinalDestination
        self.finalArrival = finalArrival
    }
    
    func buildFullPath(roots: [[String]] = []) -> [[String]] {
        var result: [[String]] = []
        
        if roots.isEmpty {
            result.append([value])
        } else {
            for root in roots {
                if let finalArrival = finalArrival {
                    result.append(root + [value, finalArrival])
                } else {
                    result.append(root + [value])
                }
            }
        }
        
        if isFinalDestination {
            return result
        }
        
        var newResult: [[String]] = []
        
        for destination in destinations {
            let next = destination.buildFullPath(roots: result)
            
            if !next.isEmpty {
                for element in next {
                    newResult.append(element)
                }
            }
        }
        
        return newResult
    }

}

extension Array where Element == (depart: String, arrival: String) {
    
    func buildItineraries(start: String) -> [Itinerary] {
        var result: [Itinerary] = []
        let didReachfinalDestination = self.count == 1
        
        let possibilities = getPossibilities(element: start)
        for possibility in possibilities {
            let itinerary = Itinerary(value: possibility.choice.depart, destinations: possibility.diff.buildItineraries(start: possibility.choice.arrival))
            itinerary.isFinalDestination = didReachfinalDestination
            if didReachfinalDestination {
                itinerary.finalArrival = possibility.choice.arrival
            }
            result.append(itinerary)
        }
        
        return result
    }
    
    func getPossibilities(element: String) -> [(choice: (depart: String, arrival: String), diff: [(depart: String, arrival: String)])] {
        
        var possibilities: [(choice: (depart: String, arrival: String), diff: [(depart: String, arrival: String)])] = []
        
        for i in 0..<self.count {
            let item = self[i]
            
            if item.depart == element {
                var copy = self
                copy.remove(at: i)
                
                possibilities.append((item, copy))
            }
        }
        
        return possibilities
    }
}

extension Array where Element == Array<String> {
    func lexicographicallySmallestPath() -> [String]? {
        if self.isEmpty {
            return nil
        }
        
        var flattened: [String] = []
        
        for element in self {
            flattened.append(element.joined(separator: ""))
        }
        
        var index = 0
        var value = flattened.first!
        
        for i in 0..<flattened.count {
            let item = flattened[i]
            
            if item < value {
                value = item
                index = i
            }
        }
        
        return self[index]
    }
}
