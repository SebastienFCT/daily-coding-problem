//
//  Problem_363Tests.swift
//  Problem 363Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-22.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_363

class Problem_363Tests: XCTestCase {

    func test_example() {
        
        XCTAssert(add_substract(values: 7) == 7)
        XCTAssert(add_substract(values: 1, 2, 3) == 0)
        XCTAssert(add_substract(values: -5, 10, 3, 9) == 11)
    }

}
