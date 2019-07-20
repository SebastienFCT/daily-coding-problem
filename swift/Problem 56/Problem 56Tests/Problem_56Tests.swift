//
//  Problem_56Tests.swift
//  Problem 56Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_56

class Problem_56Tests: XCTestCase {

    func test_1() {
        let input = [
            [2,1,0,0,1,0],
            [1,0,1,0,1,0],
            [0,1,0,1,0,0],
            [0,0,1,0,1,1],
            [1,1,0,1,0,0],
            [0,0,0,1,0,0]
        ]
        
        XCTAssertFalse(input.isValid(k: 1))
        XCTAssertFalse(input.isValid(k: 2))
        XCTAssertFalse(input.isValid(k: 3))
        XCTAssertTrue(input.isValid(k: 4))
        XCTAssertTrue(input.isValid(k: 5))
        XCTAssertTrue(input.isValid(k: 6))
    }

}
