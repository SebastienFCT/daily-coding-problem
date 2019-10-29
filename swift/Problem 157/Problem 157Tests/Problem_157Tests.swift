//
//  Problem_157Tests.swift
//  Problem 157Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-29.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_157

class Problem_157Tests: XCTestCase {

    func test_example() {
        XCTAssertTrue("carrace".isPalindrome())
        XCTAssertFalse("daily".isPalindrome())
    }

}
