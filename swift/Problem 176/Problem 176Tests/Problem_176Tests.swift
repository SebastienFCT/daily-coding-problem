//
//  Problem_176Tests.swift
//  Problem 176Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_176

class Problem_176Tests: XCTestCase {

    func test_example() {
        XCTAssertTrue("abc".hasOneToOneCharacterMapping(with: "bcd"))
        XCTAssertFalse("foo".hasOneToOneCharacterMapping(with: "bar"))
    }

}
