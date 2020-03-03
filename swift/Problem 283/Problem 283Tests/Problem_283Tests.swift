//
//  Problem_283Tests.swift
//  Problem 283Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-03.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_283

class Problem_283Tests: XCTestCase {

    func test_regular_numbers() {
        
        XCTAssert(regularNumbers(limit: 20) == [1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, 16, 18, 20, 24, 25, 27, 30, 32, 36])
    }

}
