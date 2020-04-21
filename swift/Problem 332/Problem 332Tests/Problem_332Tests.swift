//
//  Problem_332Tests.swift
//  Problem 332Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-21.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_332

class Problem_332Tests: XCTestCase {

    func test_jane_street_problem() {
        
        for _ in 0...10000 {
            let left = Int.random(in: 10...100)
            let right = Int.random(in: 10...100)
            let input = JSProblem(m: left, n: right)
            
            print("result for (\(left), \(right)) are \(input.findPairs())")
        }
    }

}
