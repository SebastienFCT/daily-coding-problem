//
//  Solution.swift
//  Problem 23
//
//  Created by sebastien FOCK CHOW THO on 2019-06-19.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Bool> {
    func nextStep(position: (Int, Int), goal: (Int, Int)) -> (Int, Int)? {
        
        var nextStep = (0, 0)
        
        let yDif = abs(position.0 - goal.0)
        let xDif = abs(position.1 - goal.1)
        
        if xDif == 0 && yDif == 0 {
            return nil
        }
        
        if xDif == 0 {
            if position.0 < goal.0 {
                nextStep.0 = position.0 + 1
                nextStep.1 = position.1
            } else {
                nextStep.0 = position.0 - 1
                nextStep.1 = position.1
            }
            
            return nextStep
        }
        
        if yDif == 0 {
            if position.1 < goal.1 {
                nextStep.1 = position.1 + 1
                nextStep.0 = position.0
            } else {
                nextStep.1 = position.1 - 1
                nextStep.0 = position.0
            }
            
            return nextStep
        }
        
        if yDif < xDif {
            if position.0 < goal.0 {
                nextStep.0 = position.0 + 1
                nextStep.1 = position.1
            } else {
                nextStep.0 = position.0 - 1
                nextStep.1 = position.1
            }
        } else {
            if position.1 < goal.1 {
                nextStep.1 = position.1 + 1
                nextStep.0 = position.0
            } else {
                nextStep.1 = position.1 - 1
                nextStep.0 = position.0
            }
        }
        
        return nextStep
    }
}

class Path {
    var map: [[Bool]]
    var currentPosition: (Int, Int)
    var goal: (Int, Int)
    var visited: [(Int, Int)]
    
    init(map: [[Bool]], currentPosition: (Int, Int), goal: (Int, Int), visited: [(Int, Int)]) {
        self.map = map
        self.currentPosition = currentPosition
        self.goal = goal
        self.visited = visited
    }
    
    func buildPaths() -> [[(Int, Int)]] {
        var result: [[(Int, Int)]] = []
        
        if currentPosition == goal {
            // We arrived!
            result.append(visited)
            return result
        }
        
        let top = (currentPosition.0 - 1, currentPosition.1)
        let bottom = (currentPosition.0 + 1, currentPosition.1)
        let left = (currentPosition.0, currentPosition.1 - 1)
        let right = (currentPosition.0, currentPosition.1 + 1)
        
        let possiblePaths = [top, bottom, left, right].filter{ $0.0 >= 0 && $0.0 <= map.count-1 && $0.1 >= 0 && $0.1 <= map[0].count-1 }    // Here we assume each row of the map are equal
        
        for possiblePath in possiblePaths {
            if map[possiblePath.0][possiblePath.1] == true {
                // This is a wall
                continue
            }
            
            if visited.contains(where: { (x, y) -> Bool in
                return x == possiblePath.0 && y == possiblePath.1
            }) {
                // We already visited this position
                continue
            }
            
            let path = Path(map: self.map, currentPosition: possiblePath, goal: self.goal, visited: self.visited + [possiblePath])
            result += path.buildPaths()
        }
        
        return result
    }
    
    func findOptimalPath() -> [(Int, Int)]? {
        return buildPaths().sorted{ $0.count < $1.count }.first
    }
    
    func findOptimalPathLength() -> Int? {
        let sorted = buildPaths().sorted{ $0.count < $1.count }
        if let result = sorted.first {
            return result.count - 1 // The initial position isn't considered a "step", however I still like being able to track the whole "path"
        } else {
            return nil
        }
    }
}
