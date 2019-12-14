//
//  Problem_203Tests.swift
//  Problem 203Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_203

class Problem_203Tests: XCTestCase {

    func test_example() {
        XCTAssert([5, 7, 10, 3, 4].minValue() == 3)
    }
    
    func test_case_2() {
        XCTAssert([9, 10, 11, 1, 2, 3, 4, 5, 6, 7, 8].minValue() == 1)
    }
    
    func test_case_3() {
        XCTAssert([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].minValue() == 1)
    }

}
