//
//  Problem_18Tests.swift
//  Problem 18Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_18

class Problem_18Tests: XCTestCase {

    func testExample() {
        let input =  [10, 5, 2, 7, 8, 7]
        XCTAssert(input.getMaxValueOfSubarray(ofLength: 3) == [10, 7, 8, 8])
        XCTAssert(input.getMaxValueOfSubarray(ofLength: 4) == [10, 8, 8])
        XCTAssert(input.getMaxValueOfSubarray(ofLength: 5) == [10, 8])
        XCTAssert(input.getMaxValueOfSubarray(ofLength: 6) == [10])
    }

}
