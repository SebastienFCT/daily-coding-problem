//
//  Problem_331Tests.swift
//  Problem 331Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-20.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_331

class Problem_331Tests: XCTestCase {

    func test_example() {
        
        let input = "xyxxxyxyy"
        
        let actual = input.countMinFlips()
        let expected = 2
        
        XCTAssert(actual == expected)
    }

}
