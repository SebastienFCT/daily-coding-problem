//
//  Problem_108Tests.swift
//  Problem 108Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_108

class Problem_108Tests: XCTestCase {

    func test_example_1() {
        let input = "abcde"
        XCTAssertTrue(input.canShiftTo(target: "cdeab"))
    }
    
    func test_example_2() {
        let input = "abc"
        XCTAssertFalse(input.canShiftTo(target: "acb"))
    }

}
