//
//  Problem_193Tests.swift
//  Problem 193Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-04.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_193

class Problem_193Tests: XCTestCase {

    func test_example() {
        XCTAssert([1, 3, 2, 8, 4, 10].optimizeTransactions(withSellingFees: 2) == 9)
    }

}
