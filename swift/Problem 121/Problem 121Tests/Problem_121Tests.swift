//
//  Problem_121Tests.swift
//  Problem 121Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_121

class Problem_121Tests: XCTestCase {

    func test_example() {
        let input = "waterrfetawx"
        XCTAssertTrue(input.canBuildPalindrome(maxDeletion: 2))
        XCTAssertFalse(input.canBuildPalindrome(maxDeletion: 1))
    }

}
