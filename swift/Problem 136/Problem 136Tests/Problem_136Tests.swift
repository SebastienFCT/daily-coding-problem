//
//  Problem_136Tests.swift
//  Problem 136Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_136

class Problem_136Tests: XCTestCase {

    func test_example() {
        let input = [
            [1, 0, 0, 0],
            [1, 0, 1, 1],
            [1, 0, 1, 1],
            [0, 1, 0, 0]
        ]
        
        XCTAssert(input.largestIslandSize() == 4)
    }

}
