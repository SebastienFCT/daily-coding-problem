//
//  Problem_39Tests.swift
//  Problem 39Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-03.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_39

class Problem_39Tests: XCTestCase {

    func test_1() {
        let input: [[Character]] = [
            [".", ".", "."],
            ["*", "*", "."],
            [".", ".", "*"]
        ]
        
        XCTAssert(input.neighbourCount(row: 1, column: 1) == (live: 2, dead: 6))
        XCTAssert(input.neighbourCount(row: 2, column: 2) == (live: 1, dead: 2))
        XCTAssert(input.neighbourCount(row: 1, column: 0) == (live: 1, dead: 4))
    }
    
    func test_2() {
        var input: [[Character]] = [
            [" ", "*", "*", "*", " ", " "],
            ["*", "*", " ", "*", "*", "*"],
            ["*", " ", "*", " ", " ", "*"],
            [" ", " ", " ", "*", " ", "*"],
            ["*", "*", " ", " ", "*", "*"],
            [" ", "*", " ", "*", "*", " "]
        ]
        
        print(input.neighbourCount(row: 0, column: 0))
        input.gameOfLive(iterations: 10)
    }

}
