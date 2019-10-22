//
//  Problem_149Tests.swift
//  Problem 149Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_149

class Problem_149Tests: XCTestCase {

    func test_example() {
        let input = CustomList(list: [1, 2, 3, 4, 5])
        XCTAssert(input.sum(1, 3) == input.sumByLoop(1, 3))
        XCTAssert(input.sum(0, 4) == input.sumByLoop(0, 4))
    }
    
    func test_other() {
        let input = CustomList(list: [21, 34, 54, 4123, 4545, 62, 662, 75, 234, 11, 76, 2354, 7])
        XCTAssert(input.sum(1, 3) == input.sumByLoop(1, 3))
        XCTAssert(input.sum(5, 8) == input.sumByLoop(5, 8))
        XCTAssert(input.sum(0, 12) == input.sumByLoop(0, 12))
    }

}
