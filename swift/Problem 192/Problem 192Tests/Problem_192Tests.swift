//
//  Problem_192Tests.swift
//  Problem 192Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-03.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_192

class Problem_192Tests: XCTestCase {

    func test_example_1() {
        XCTAssertTrue([1, 3, 1, 2, 0, 1].canReachTheEndByWalkingAtMostEachIndex())
    }
    
    func test_example_2() {
        XCTAssertFalse([1, 2, 1, 0, 0].canReachTheEndByWalkingAtMostEachIndex())
    }
}
