//
//  Problem_255Tests.swift
//  Problem 255Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-04.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_255

class Problem_255Tests: XCTestCase {

    func test_example() {
        
        let input = [
            [0, 1, 3],
            [1, 2],
            [2],
            [3]
        ]
        
        let expected = [
            [1, 1, 0, 1],
            [0, 1, 1, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1]
        ]
        
        let actual = input.transitiveClosure()
        
        XCTAssert(actual == expected)
    }

}
