//
//  Problem_148Tests.swift
//  Problem 148Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_148

class Problem_148Tests: XCTestCase {

    func test_example() {
        XCTAssert(AppleGrayCode().possibilities(for: 2) == [[0, 0], [0, 1], [1, 0], [1, 1]])
        XCTAssert(AppleGrayCode().possibilities(for: 4) == [
            [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 1, 0], [0, 0, 1, 1],
            [0, 1, 0, 0], [0, 1, 0, 1], [0, 1, 1, 0], [0, 1, 1, 1],
            [1, 0, 0, 0], [1, 0, 0, 1], [1, 0, 1, 0], [1, 0, 1, 1],
            [1, 1, 0, 0], [1, 1, 0, 1], [1, 1, 1, 0], [1, 1, 1, 1]]
        )
    }

}
