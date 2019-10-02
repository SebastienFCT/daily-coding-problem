//
//  Problem_130Tests.swift
//  Problem 130Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_130

class Problem_130Tests: XCTestCase {

    func test_example() {
        let input = [5, 2, 4, 0, 1]
        XCTAssert(input.maxProfits(k: 2) == 3)
    }

}
