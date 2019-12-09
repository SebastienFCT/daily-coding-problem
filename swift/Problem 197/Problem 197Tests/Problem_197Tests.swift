//
//  Problem_197Tests.swift
//  Problem 197Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_197

class Problem_197Tests: XCTestCase {

    func test_rotate() {
        var input = [1, 2, 3, 4, 5]
        input.rotate(k: 3)
        let expected = [2, 3, 4, 1, 5]
        
        XCTAssert(input == expected)
    }

}
