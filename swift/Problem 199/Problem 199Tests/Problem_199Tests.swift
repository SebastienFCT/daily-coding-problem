//
//  Problem_199Tests.swift
//  Problem 199Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_199

class Problem_199Tests: XCTestCase {

    func test_example_1() {
        XCTAssert("(()".closerBalancedParentheses() == "(())")
    }
    
    func test_example_2() {
        XCTAssert("))()(".closerBalancedParentheses() == "()()()()")
    }

}
