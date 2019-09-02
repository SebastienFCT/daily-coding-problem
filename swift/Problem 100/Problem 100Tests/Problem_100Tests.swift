//
//  Problem_100Tests.swift
//  Problem 100Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_100

class Problem_100Tests: XCTestCase {

    func test_example() {
        let input: [Point] = [(0, 0), (1, 1), (1, 2)]
        XCTAssert(input.minimumSteps() == 2)
    }

}
