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
