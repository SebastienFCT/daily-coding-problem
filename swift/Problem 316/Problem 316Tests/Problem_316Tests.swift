//
//  Problem_316Tests.swift
//  Problem 316Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-05.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_316

class Problem_316Tests: XCTestCase {

    func test_example() {
        
        let input = [1, 0, 1, 1, 2]
        
        let actual = input.denominations()
        let expected = [2, 3, 4]
        
        XCTAssert(actual == expected)
    }

}
