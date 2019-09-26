//
//  Problem_123Tests.swift
//  Problem 123Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-25.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_123

class Problem_123Tests: XCTestCase {

    func test_example() {
        XCTAssertTrue("10".representNumber())
        XCTAssertTrue("-10".representNumber())
        XCTAssertTrue("10.1".representNumber())
        XCTAssertTrue("-10.1".representNumber())
        XCTAssertTrue("1e5".representNumber())
        XCTAssertFalse("a".representNumber())
        XCTAssertFalse("x 1".representNumber())
        XCTAssertFalse("a -2".representNumber())
        XCTAssertFalse("-".representNumber())
    }

}
