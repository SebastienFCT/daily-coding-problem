//
//  Problem_260Tests.swift
//  Problem 260Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-09.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_260

class Problem_260Tests: XCTestCase {

    func test_example() {
        
        let js = JumbledSequence()
        let actual = js.solve(input: ["+", "+", "-", "+"])
        let expected = [1, 2, 3, 0, 4]
        
        XCTAssert(actual == expected)
    }

}
