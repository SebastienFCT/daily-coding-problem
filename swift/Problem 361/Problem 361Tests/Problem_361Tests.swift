//
//  Problem_361Tests.swift
//  Problem 361Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-20.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_361

class Problem_361Tests: XCTestCase {

    func test_example1() {
        let input = Mastermind(guesses: [
            "175286": 2,
            "293416": 3,
            "654321": 0
        ])
        
        XCTAssertTrue(input.solvable())
    }
    
    func test_example2() {
        let input = Mastermind(guesses: [
            "123456": 4,
            "345678": 4,
            "567890": 4
        ])
        
        XCTAssertFalse(input.solvable())
    }

}
