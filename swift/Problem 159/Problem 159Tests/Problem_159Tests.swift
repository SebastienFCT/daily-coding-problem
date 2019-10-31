//
//  Problem_159Tests.swift
//  Problem 159Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-31.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_159

class Problem_159Tests: XCTestCase {

    func test_example() {
        XCTAssert("acbbac".firstRecurringCharacter() == "b")
        XCTAssertNil("abcdef".firstRecurringCharacter())
    }

}
