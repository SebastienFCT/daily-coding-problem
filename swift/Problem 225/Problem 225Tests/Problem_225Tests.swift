//
//  Problem_225Tests.swift
//  Problem 225Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-05.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_225

class Problem_225Tests: XCTestCase {

    func test_example() {
        
        XCTAssert([0, 1, 2, 3, 4].last(withInterval: 2) == 3)
    }

}
