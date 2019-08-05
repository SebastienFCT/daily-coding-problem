//
//  Solution.swift
//  Problem 72
//
//  Created by sebastien FOCK CHOW THO on 2019-08-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    I would solve this problem in two steps:
 
    - First I would write a function that find all possible path for a given graph
    - Then I would write a function that given the possible paths, would find the greatest path value
 
 */

struct DirectedGraph {
    var nodes: String
    var edges: [(Int, Int)]
    
    func findPathValue() -> (key: Character, value: Int)? {
        var candidates: [(index: Int, value: String)] = []
        
        for i in 0..<edges.count {
            let value = nodes[nodes.index(nodes.startIndex, offsetBy: i)]
            
            if let possiblePaths = paths(current: (i, String(value)), previouslyVisited: [i]) {
                candidates.append(contentsOf: possiblePaths)
            } else {
                // We found a loop
                return nil
            }
        }
        
        // Get paths value for each potential sub-tree
        let mapped = candidates.map{ $0.value }
        
        var pathValues: [[Character: Int]] = []
        
        for item in mapped {
            var aPath: [Character: Int] = [:]
            
            for character in item {
                if aPath.keys.contains(character) {
                    aPath[character]! += 1
                } else {
                    aPath[character] = 1
                }
            }
            
            pathValues.append(aPath)
        }
        
        // Only keep greatest path values for each character
        var bestPV: [Character: Int] = [:]
        
        for character in nodes {
            if !bestPV.keys.contains(character) {
                bestPV[character] = 0
            }
            
            for pathValue in pathValues {
                if pathValue.keys.contains(character) {
                    if pathValue[character]! > bestPV[character]! {
                        bestPV[character] = pathValue[character]!
                    }
                }
            }
        }
        
        // Sort and return greatest value
        let sortedPathValues = bestPV.sorted{ $0.value > $1.value }
        
        return sortedPathValues.first!
    }
    
    private func paths(current: (index: Int, value: String), previouslyVisited: [Int]) -> [(index: Int, value: String)]? {
        var candidates: [(index: Int, value: String)] = []
        var visited = previouslyVisited
        
        for edge in edges {
            if edge.0 == current.index {
                // If an index had already been visited, then we have a loop
                if previouslyVisited.contains(where: { (value) -> Bool in
                    value == edge.1
                }) {
                    return nil
                }
                
                var copy = current
                copy.index = edge.1
                copy.value += String(nodes[nodes.index(nodes.startIndex, offsetBy: edge.1)])
                visited.append(edge.1)
                
                
                candidates.append(copy)
            }
        }
        
        if candidates.isEmpty {
            return [current]
        }
        
        var result: [(index: Int, value: String)] = []
        
        for candidate in candidates {
            guard let paths = paths(current: candidate, previouslyVisited: visited) else {
                // This leads to a loop
                return nil
            }
            
            result.append(contentsOf: paths)
        }
    
        return result
    }
}
