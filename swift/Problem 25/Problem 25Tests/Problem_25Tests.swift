//
//  Problem_25Tests.swift
//  Problem 25Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_25

class Problem_25Tests: XCTestCase {

    func test_1() {
        XCTAssertTrue("hello world".matches("hello world"))
        XCTAssertFalse("hello wolrd".matches("hello"))
        XCTAssertFalse("hello wolrd".matches("world"))
    }
    
    func test_2() {
        XCTAssertTrue("hello world".matches("hello.world"))
        XCTAssertTrue("hello world".matches("he.l. w.rld"))
        XCTAssertFalse("hello world".matches("hello .world"))
    }
    
    func test_3() {
        XCTAssertTrue("hello world".matches("hello*ld"))
        XCTAssertTrue("hello world".matches("hello*"))
        XCTAssertFalse("hello world".matches("hello*XYZ"))
    }

}
