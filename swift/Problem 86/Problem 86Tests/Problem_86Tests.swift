//
//  Problem_86Tests.swift
//  Problem 86Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-19.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_86

class Problem_86Tests: XCTestCase {

    func test_example() {
        let input = "()())()"
        XCTAssert(input.countNonValidParentheses() == 1)
    }
    
    func test_example2() {
        let input = ")("
        XCTAssert(input.countNonValidParentheses() == 2)
    }

}
