//
//  Problem_122Tests.swift
//  Problem 122Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-24.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_122

class Problem_122Tests: XCTestCase {

    func test_example() {
        let input: [[Int]] = [
            [0, 3, 1, 1],
            [2, 0, 0, 4],
            [1, 5, 3, 1]
        ]
        
        XCTAssert(input.findMaximumPath()?.sum == 12)
    }

}
