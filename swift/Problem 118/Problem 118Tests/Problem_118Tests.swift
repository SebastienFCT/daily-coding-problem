//
//  Problem_118Tests.swift
//  Problem 118Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_118

class Problem_118Tests: XCTestCase {

    func test_example() {
        let input = [-9, -2, 0, 2, 3]
        
        XCTAssert(input.squareAndSort() == [0, 4, 4, 9, 81])
    }

}
