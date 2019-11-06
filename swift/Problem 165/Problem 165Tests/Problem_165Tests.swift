//
//  Problem_165Tests.swift
//  Problem 165Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-06.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_165

class Problem_165Tests: XCTestCase {

    func test_example() {
        XCTAssert([3, 4, 9, 6, 1].mapToTotalSmallerElementToTheRight() == [1, 1, 2, 1, 0])
    }

}
