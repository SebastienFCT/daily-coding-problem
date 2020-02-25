//
//  Problem_274Tests.swift
//  Problem 274Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-24.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_274

class Problem_274Tests: XCTestCase {

    func test_example() {
        
        let input = "-1 + (2 + 3)"
        let expected = 4
        let actual = input.eval()
        
        XCTAssert(actual == expected)
    }

}
