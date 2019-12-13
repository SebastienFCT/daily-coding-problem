//
//  Problem_201Tests.swift
//  Problem 201Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_201

class Problem_201Tests: XCTestCase {

    func test_example() {
        XCTAssert([[1], [2, 3], [1, 5, 1]].maximumWeight() == 9)
    }

}
