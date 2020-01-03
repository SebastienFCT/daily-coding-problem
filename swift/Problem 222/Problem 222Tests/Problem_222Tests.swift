//
//  Problem_222Tests.swift
//  Problem 222Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-02.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_222

class Problem_222Tests: XCTestCase {

    func test_example() {
        let input = "/usr/bin/../bin/./scripts/../"
        let actual = input.shortestStandardizedPath()
        let expected = "/usr/bin/"
        
        XCTAssert(actual == expected)
    }

}
