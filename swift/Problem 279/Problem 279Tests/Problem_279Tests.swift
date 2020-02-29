//
//  Problem_279Tests.swift
//  Problem 279Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-28.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_279

class Problem_279Tests: XCTestCase {

    func test_example() {
        let input: [Friendlist] = [
            (0, [1, 2]),
            (1, [0, 5]),
            (2, [0]),
            (3, [6]),
            (4, []),
            (5, [1]),
            (6, [3])
        ]
        
        XCTAssert(input.friendGroups().count == 3)
    }

}
