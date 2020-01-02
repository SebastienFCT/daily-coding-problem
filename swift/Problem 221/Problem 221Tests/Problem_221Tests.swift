//
//  Problem_221Tests.swift
//  Problem 221Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-01.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_221

class Problem_221Tests: XCTestCase {

    func test_sevenish() {
        XCTAssert(Sevenish().getValue(atIndex: 0) == 1)
        XCTAssert(Sevenish().getValue(atIndex: 1) == 7)
        XCTAssert(Sevenish().getValue(atIndex: 2) == 8)
        XCTAssert(Sevenish().getValue(atIndex: 3) == 49)
    }

}
