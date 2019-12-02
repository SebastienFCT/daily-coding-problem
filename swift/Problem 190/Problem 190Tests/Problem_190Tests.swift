//
//  Problem_190Tests.swift
//  Problem 190Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-01.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_190

class Problem_190Tests: XCTestCase {

    func test_example_1() {
        XCTAssert([8, -1, 3, 4].maxSubArraySum() == 15)
    }
    
    func test_example_2() {
        XCTAssert([-4, 5, 1, 0].maxSubArraySum() == 6)
    }

}
