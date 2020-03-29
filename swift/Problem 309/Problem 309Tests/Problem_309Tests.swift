//
//  Problem_309Tests.swift
//  Problem 309Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-29.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_309

class Problem_309Tests: XCTestCase {

    func test_example() {
        
        let input = [0, 1, 1, 0, 1, 0, 0, 0, 1]
        
        let actual = input.minCostForDefragmentation()
        let expected = 5
        
        XCTAssert(actual == expected)
    }

}
