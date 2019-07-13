//
//  Problem_49Tests.swift
//  Problem 49Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_49

class Problem_49Tests: XCTestCase {

    func test_example() {
        let input = [34, -50, 42, 14, -5, 86]
        XCTAssert(input.findLargestConsecutiveSum() == 137)
    }
    
    func test_example2() {
        let input = [-5, -1, -8, -9]
        XCTAssert(input.findLargestConsecutiveSum() == 0)
    }

}
