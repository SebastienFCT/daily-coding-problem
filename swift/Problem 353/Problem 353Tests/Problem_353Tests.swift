//
//  Problem_353Tests.swift
//  Problem 353Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-12.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_353

class Problem_353Tests: XCTestCase {

    func test_example() {
        
        let input = [1, 3, 2, 5]
        
        let actual = input.maxArea()
        let expected = 6
        
        XCTAssert(actual == expected)
    }

}
