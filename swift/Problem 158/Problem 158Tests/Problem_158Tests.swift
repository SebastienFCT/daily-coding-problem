//
//  Problem_158Tests.swift
//  Problem 158Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_158

class Problem_158Tests: XCTestCase {

    func test_example() {
        let input = [
            [0, 0, 1],
            [0, 0, 1],
            [1, 0, 0]
        ]
        
        XCTAssert(input.pathCountFromTopLeftToBottomRight() == 2)
    }

}
