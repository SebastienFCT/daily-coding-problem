//
//  Problem_293Tests.swift
//  Problem 293Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-13.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_293

class Problem_293Tests: XCTestCase {

    func test_example() {
        
        let input = Pyramid(stones: [1, 1, 3, 3, 2, 1])
        
        let actual = input.build()
        let expectedCost = 2
        let expectedResult = [0, 1, 2, 3, 2, 1]
        
        XCTAssert(actual?.cost == expectedCost)
        XCTAssert(actual?.result == expectedResult)
    }

}
