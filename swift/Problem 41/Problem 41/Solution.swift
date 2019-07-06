//
//  Solution.swift
//  Problem 41
//
//  Created by sebastien FOCK CHOW THO on 2019-07-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    In this problem, we must:
 
    - Find all possible ways (in order to display the "lexicographically smallest one"
    - Determine if there is no possible way at home
 
    Building a tree seems to be an ideal solution
 
    Let's start by building a Itinerary class that will correspond to one flight. It will hold a reference to possible next Itinerary
 
 */
class Itinerary {
    var value: String
    var destinations: [Itinerary]
    var isFinalDestination: Bool

    init(value: String, destinations: [Itinerary], isFinalDestination: Bool = false) {
        self.value = value
        self.destinations = destinations
        self.isFinalDestination = isFinalDestination
    }
}

/**
    I'm now building a function that generate all possible path
 
    I added `isFinalDestination` as I realized that I needed somehow a way to determine if the loop ended
 */
extension Array where Element == (depart: String, arrival: String) {
    
    func buildItineraries(start: String) -> [Itinerary] {
        var result: [Itinerary] = []
        let didReachfinalDestination = self.count == 1
        
        let possibilities = getPossibilities(element: start)
        
        for possibility in possibilities {
            let itinerary = Itinerary(value: possibility.choice.depart, destinations: possibility.diff.buildItineraries(start: possibility.choice.arrival))
            itinerary.isFinalDestination = didReachfinalDestination
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
/**
 
    Finally, let's build a function that find all full path
 
 */
extension Array where Element == Itinerary {
    
    func getFullPath() -> [[String]] {
        let result: [[String]] = []
        
        
        
        return result
    }

}

extension Itinerary {
    
    func buildFullPath(root: [[String]] = []) -> [[String]] {
        
        let newRoot = root.map{ $0 + [value] }
        
        if isFinalDestination {
            return newRoot
        }
        
        var result: [[String]] = []
        
        for destination in destinations {
            result += destination.buildFullPath(root: newRoot)
        }
        
        return result
    }
}
