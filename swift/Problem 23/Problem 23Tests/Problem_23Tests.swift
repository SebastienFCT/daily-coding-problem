//
//  Problem_23Tests.swift
//  Problem 23Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-19.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_23

class Problem_23Tests: XCTestCase {

    func testNextStep() {
        let input = [
              [true, true, true]
            , [true, true, true]
            , [true, true, true]
        ]
        
        var start = (2, 0)
        let end = (0, 2)
        
        while start != end {
            if let nextStep = input.nextStep(position: start, goal: end) {
                start = nextStep
                print("next step is : \(nextStep)")
            } else {
                return
            }
        }
    }
    
    func testPathBuilder() {
        let map = [
              [false, false, false]
            , [false, true, false]
            , [false, false, false]
        ]
        
        let currentPosition = (2, 0)
        let goal = (0, 2)
        
        let start = Path(map: map, currentPosition: currentPosition, goal: goal, visited: [currentPosition])
        let expectedSolution1 = [(2, 0), (1, 0), (0, 0), (0, 1), (0, 2)]
        let expectedSolution2 = [(2, 0), (2, 1), (2, 2), (1, 2), (0, 2)]
        
        if let optimalPath = start.findOptimalPath() {
            let condition1 = (optimalPath.map{ $0.0 } == expectedSolution1.map{ $0.0 }) && (optimalPath.map{ $0.1 } == expectedSolution1.map{ $0.1 })
            let condition2 = (optimalPath.map{ $0.0 } == expectedSolution2.map{ $0.0 }) && (optimalPath.map{ $0.1 } == expectedSolution2.map{ $0.1 })
            
            XCTAssert(condition1 || condition2, "Optimal path(s) didn't meet expectations")
        } else {
            XCTFail("No optimal path found")
        }
    }
    
    func testExample() {
        let map = [
              [false, false, false, false]
            , [true, true, false, true]
            , [false, false, false, false]
            , [false, false, false, false]
        ]
        
        let currentPosition = (3, 0)
        let goal = (0, 0)
        
        let start = Path(map: map, currentPosition: currentPosition, goal: goal, visited: [currentPosition])
        XCTAssert(start.findOptimalPathLength()! == 7)
    }

}
