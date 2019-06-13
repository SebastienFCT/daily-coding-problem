//
//  Problem_7Tests.swift
//  Problem 7Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_7

class Problem_7Tests: XCTestCase {
    func testExample() {
        let input = "111"
        XCTAssert(input.decypher() == 3)
    }
    
    func test2() {
        let input = "261"
        XCTAssert(input.decypher() == 2)
    }
    
    func test3() {
        let input = "299"
        XCTAssert(input.decypher() == 1)
    }
}
