//
//  Problem_298Tests.swift
//  Problem 298Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-18.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_298

class Problem_298Tests: XCTestCase {

    func test_example() {
        
        let input = [2, 1, 2, 3, 3, 1, 3, 5]
        let actual = input.longestPortionForAnyPair()
        
        XCTAssert(actual.length == 4)
        XCTAssert(actual.pair.0 == 1 && actual.pair.1 == 3)
    }

}
