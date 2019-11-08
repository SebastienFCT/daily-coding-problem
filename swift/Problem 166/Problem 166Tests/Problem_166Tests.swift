//
//  Problem_166Tests.swift
//  Problem 166Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-07.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_166

class Problem_166Tests: XCTestCase {

    func test_example() {
        let iterator = Iterator2D(elements: [[1, 2], [3], [], [4, 5, 6]])
        XCTAssertTrue(iterator.has_next())
        XCTAssert(iterator.next() == 1)
        XCTAssert(iterator.next() == 2)
        XCTAssertTrue(iterator.has_next())
        XCTAssert(iterator.next() == 3)
        XCTAssert(iterator.next() == 4)
        XCTAssert(iterator.next() == 5)
        XCTAssertTrue(iterator.has_next())
        XCTAssert(iterator.next() == 6)
        XCTAssertFalse(iterator.has_next())
        
    }

}
