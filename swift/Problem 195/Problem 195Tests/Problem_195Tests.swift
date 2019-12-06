//
//  Problem_195Tests.swift
//  Problem 195Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-06.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_195

class Problem_195Tests: XCTestCase {

    func test_example() {
        let input = [
            [1, 3, 7, 10, 15, 20],
            [2, 6, 9, 14, 22, 25],
            [3, 8, 10, 15, 25, 30],
            [10, 11, 12, 23, 30, 35],
            [20, 25, 30, 35, 40, 45]
        ]
        
        let computed = input.countWhereElement(smallerThanElementAt: (1, 1), andGreaterThanElementAt: (3, 3))
        
        let expected = 0
        
        // There are no value smaller than 6 and greater than 23
        XCTAssert(computed == expected)
    }
    
    func test_example_1() {
        let input = [
            [1, 3, 7, 10, 15, 20],
            [2, 6, 9, 14, 22, 25],
            [3, 8, 10, 15, 25, 30],
            [10, 11, 12, 23, 30, 35],
            [20, 25, 30, 35, 40, 45]
        ]
        
        let computed = input.countWhereElement(smallerThanElementAt: (3, 3), andGreaterThanElementAt: (1, 1))
        
        // greater than 6 and lesser than 23 are
        // 7, 10, 15, 20, 9, 14, 22, 8, 10, 15, 10, 11, 12, 20
        let expected = 14
        
        XCTAssert(computed == expected)
    }

}
