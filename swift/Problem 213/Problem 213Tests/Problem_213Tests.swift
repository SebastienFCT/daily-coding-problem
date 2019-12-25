//
//  Problem_213Tests.swift
//  Problem 213Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-24.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_213

class Problem_213Tests: XCTestCase {

    func test_example() {
        let input = "2542540123"
        let expected = ["254.25.40.123", "254.254.0.123"]
        let actual = input.ipCandidates()
        
        XCTAssert(actual == expected)
    }

}
