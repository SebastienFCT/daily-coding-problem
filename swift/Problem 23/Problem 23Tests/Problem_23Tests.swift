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

}
