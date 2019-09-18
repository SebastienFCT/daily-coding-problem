//
//  Problem_1Tests.swift
//  Problem 1Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_1

class Problem_1Tests: XCTestCase {

    func testExample() {
        let input = [10, 15, 3, 7]
        
        XCTAssertTrue(input.hasPairForSum(sum: 17))
    }

    func testFailure() {
        let input = [1, 2, 3, 4]
        
        XCTAssertFalse(input.hasPairForSum(sum: 100))
    }
}
