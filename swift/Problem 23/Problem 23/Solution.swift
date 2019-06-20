//
//  Solution.swift
//  Problem 23
//
//  Created by sebastien FOCK CHOW THO on 2019-06-19.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    I like this challenge a lot as it feels like implementing an AI for a rogue like game
 
    I'm not familiar with game development, I guess my first move would be finding the faster path without any wall
 
    0   0   0   E
 
    0   0   0   0
 
    S   0   0   0
 
    In a matrix, and given 2 points A(x1, y1) & B(x2, y2), my first intuition is to look at the minimum between (x2 - x1) and (y2 - y1), and increment the value of my point A for the minimum axis found (the logic is that if walking a step on x gets me closer to my destination that walking a step on y, then I'll start walking the step on the x axis)
 
    So in the previous example,
    - walking a step to the right on the x axis gets me 2 steps from the Exit's x value
    - walking a step to the top on the y axis gets me 1 steps from the Exit's y value
    I'll choose moving a step towards the top and a re-iterate my logic.
 
 */
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
/**
 
    If we had walls, we would need to change our strategy to find all the possible paths to reach the destination instead
 
    0   0   0   E
 
    0   1   1   1
 
    S   0   0   0
 
    Our strategy will be:
 
    - For each step loop for a next possible step
    - If current = destination, return
    - else loop
 
    We need to make sure that the next step hasn't been picked yet (to avoid infinity loop)
 
    let's build a class that will hold the paths and the position of the cursor in the matrix
 
 */
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
        
        print(currentPosition)
        
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
}
/**
 
    Finally, we're adding a final function that find the faster path:
 
    - Get all possible paths
    - Select the one with the smaller visited.count()
 
 */
extension Path {
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
