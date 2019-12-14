//
//  Problem_202Tests.swift
//  Problem 202Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_202

class Problem_202Tests: XCTestCase {

    func test_example() {
        
        XCTAssertTrue(121.isPalindrome())
        XCTAssertTrue(888.isPalindrome())
        XCTAssertFalse(678.isPalindrome())
    }

}
