//
//  Problem_185Tests.swift
//  Problem 185Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_185

class Problem_185Tests: XCTestCase {

    func test_example() {
        let left = Rectangle(topLeftAnchor: (1, 4), dimensions: (3, 3))
        let right = Rectangle(topLeftAnchor: (0, 5), dimensions: (4, 3))
        
        XCTAssert(intersection(left: left, right: right) == 6)
    }

}
