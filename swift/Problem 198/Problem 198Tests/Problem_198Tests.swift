//
//  Problem_198Tests.swift
//  Problem 198Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_198

class Problem_198Tests: XCTestCase {

    func test_example_1() {
        XCTAssert([3, 5, 10, 20, 21].largestSetWherePairsAreMultiple() == [5, 10, 20])
    }
    
    func test_example_2() {
        XCTAssert([1, 3, 6, 24].largestSetWherePairsAreMultiple() == [1, 3, 6, 24])
    }

}
