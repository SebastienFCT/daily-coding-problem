//
//  Problem_245Tests.swift
//  Problem 245Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-25.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_245

class Problem_245Tests: XCTestCase {

    func test_example() {
        
        let input = [6, 2, 4, 0, 5, 1, 1, 4, 2, 9]
        let expected = 2
        let actual = input.minJumps()
        
        XCTAssert(actual == expected)
    }

}
