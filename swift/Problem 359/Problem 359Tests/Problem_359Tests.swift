//
//  Problem_359Tests.swift
//  Problem 359Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-18.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_359

class Problem_359Tests: XCTestCase {

    func test_example() {
        
        let input = "niesevehrtfeev"
        let numFinder = NumFinder()
        
        let actual = numFinder.solve(word: input)
        let expected = 357
        
        XCTAssert(actual == expected)
    }

}
