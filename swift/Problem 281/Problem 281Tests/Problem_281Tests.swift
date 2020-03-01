//
//  Problem_281Tests.swift
//  Problem 281Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-01.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_281

class Problem_281Tests: XCTestCase {

    func test_example() {
        
        let wall = Wall(stack: [
            [3, 5, 1, 1],
            [2, 3, 3, 2],
            [5, 5],
            [4, 4, 2],
            [1, 3, 3, 3],
            [1, 1, 6, 1, 1]
        ])
        
        let expected = 8
        let actual = wall.optimalCut()
        
        XCTAssert(actual == expected)
    }

}
