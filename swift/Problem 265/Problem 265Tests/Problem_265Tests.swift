//
//  Problem_265Tests.swift
//  Problem 265Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-14.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_265

class Problem_265Tests: XCTestCase {

    func test_example() {
        let input = [10, 40, 200, 1000, 60, 30]
        let actual = input.distributeBonuses()
        let expected = [1, 2, 3, 4, 2, 1]
        
        XCTAssert(actual == expected)
    }
    
    func test_example_other() {
        let input = [10, 40, 200, 1000, 60, 30, 20, 50, 70, 50, 10]
        let actual = input.distributeBonuses()
        print(actual)
    }

}
