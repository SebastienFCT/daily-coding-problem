//
//  Problem_301Tests.swift
//  Problem 301Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-21.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
import CryptoKit
@testable import Problem_301

class Problem_301Tests: XCTestCase {

    func test_custom_struct() {
        
        var input = TripleByteCustomStruct(key: SymmetricKey(size: .bits256))
        
        XCTAssertFalse(input.check(value: "test 1"))
        input.add(value: "test 1")
        XCTAssertTrue(input.check(value: "test 1"))
        XCTAssertFalse(input.check(value: "test 2"))
        input.add(value: "test 2")
        XCTAssertTrue(input.check(value: "test 2"))
        XCTAssertFalse(input.check(value: "test 3"))
        input.add(value: "test 4")
        XCTAssertFalse(input.check(value: "test 3"))
        
        // This is a false positive (acceptable by the question)
        XCTAssertTrue(input.check(value: "test"))
    }

}
