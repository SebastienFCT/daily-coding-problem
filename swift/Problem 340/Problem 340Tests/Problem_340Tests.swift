//
//  Problem_340Tests.swift
//  Problem 340Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-29.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_340

class Problem_340Tests: XCTestCase {

    func test_example() {
        let input: [TwoDimensionalPoint] = [(1, 1), (-1, -1), (3, 4), (6, 1), (-1, -6), (-4, -3)]
        
        let actual = input.closestPair()
        
        XCTAssert((actual.left == (1, 1) && actual.right == (-1, -1)) || (actual.left == (-1, -1) && actual.right == (1, 1)))
    }

}
