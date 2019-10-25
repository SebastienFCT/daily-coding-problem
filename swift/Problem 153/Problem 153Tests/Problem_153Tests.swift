//
//  Problem_153Tests.swift
//  Problem 153Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-25.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_153

class Problem_153Tests: XCTestCase {

    func test_example() {
        XCTAssert("dog cat hello cat dog dog hello cat world".distance(between: "hello", and: "world") == 1)
    }

}
