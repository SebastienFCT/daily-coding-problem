//
//  Problem_200Tests.swift
//  Problem 200Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_200

class Problem_200Tests: XCTestCase {

    func test_example() {
        let input: [Interval] = [(1, 4), (4, 5), (7, 9), (9, 12)]
        let computed = input.smallestStabingSet()
        let expected: Interval = (4, 9)
        
        XCTAssert(computed == expected)
    }

}
