//
//  Problem_163Tests.swift
//  Problem 163Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-04.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_163

class Problem_163Tests: XCTestCase {

    func test_example() {
        let rpn = RPN(input: [15, 7, 1, 1, "+", "-", "/", 3, "*", 2, 1, 1, "+", "+", "-"])
        print(rpn.evaluate())
    }

}
