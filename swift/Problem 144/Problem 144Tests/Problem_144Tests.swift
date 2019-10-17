//
//  Problem_144Tests.swift
//  Problem 144Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_144

class Problem_144Tests: XCTestCase {

    func test_example() {
        let input = [4, 1, 3, 5, 6]
        XCTAssertTrue(input.indexOfNextLargest(ofIndex: 0) == 3)
    }
}
