//
//  Problem_321Tests.swift
//  Problem 321Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-10.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_321

class Problem_321Tests: XCTestCase {

    func test_example() {
        
        let input = 100
        
        let actual = input.lowestStepCountToOne()
        let expected = 5
        
        XCTAssert(actual == expected)
    }

}
