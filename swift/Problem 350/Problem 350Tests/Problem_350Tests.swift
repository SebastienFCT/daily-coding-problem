//
//  Problem_350Tests.swift
//  Problem 350Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-09.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_350

class Problem_350Tests: XCTestCase {

    func test_example() {

        XCTAssert(4.minimumTupleOrPerfectSquareWithMatchingSum() == 1)
        XCTAssert(17.minimumTupleOrPerfectSquareWithMatchingSum() == 2)
        XCTAssert(18.minimumTupleOrPerfectSquareWithMatchingSum() == 2)
    }
}
