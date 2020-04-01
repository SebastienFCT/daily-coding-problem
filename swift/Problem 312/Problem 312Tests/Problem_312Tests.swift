//
//  Problem_312Tests.swift
//  Problem 312Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-01.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_312

class Problem_312Tests: XCTestCase {

    func test_example() {
        
        let input = Board(columns: 4)
        
        let actual = input.countUniqueConfiguration()
        let expected = 4
        
        // A B B C | A B C D | A A B C | A A C C
        // A B C C | A B C D | A B B C | A B B C
        
        XCTAssert(actual == expected)
    }

}
