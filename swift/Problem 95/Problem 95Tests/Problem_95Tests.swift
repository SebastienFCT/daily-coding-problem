//
//  Problem_95Tests.swift
//  Problem 95Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_95

class Problem_95Tests: XCTestCase {

    func test_example() {
        let input = [1,2,3]
        XCTAssert(input.nextPermutation() == [1, 3, 2])
    }

}
