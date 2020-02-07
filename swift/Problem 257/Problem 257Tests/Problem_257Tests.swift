//
//  Problem_257Tests.swift
//  Problem 257Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-06.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_257

class Problem_257Tests: XCTestCase {

    func test_example() {
        let input = [3, 7, 5, 6, 9]
        let actual = input.boundForSmallestWindowToSort()
        let expected = (1, 3)
        
        XCTAssert(actual == expected)
    }

}
