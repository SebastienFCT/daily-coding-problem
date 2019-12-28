//
//  Problem_216Tests.swift
//  Problem 216Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-27.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_216

class Problem_216Tests: XCTestCase {

    func test_example() {
        let expected = 14
        let actual = "XIV".romanToDecimal()
        
        XCTAssert(actual == expected)
    }

}
