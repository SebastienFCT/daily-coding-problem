//
//  Problem_224Tests.swift
//  Problem 224Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-04.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_224

class Problem_224Tests: XCTestCase {

    func test_example() {
        let input = [1, 2, 3, 10]
        let actual = input.smallestPositiveIntNotInAnySumSubset()
        let expected = 7
        
        XCTAssert(actual == expected)
    }

}
