//
//  Problem_119Tests.swift
//  Problem 119Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_119

class Problem_119Tests: XCTestCase {

    func test_example() {
        let input = [Interval(min: 0, max: 3), Interval(min: 2, max: 6), Interval(min: 3, max: 4), Interval(min: 6, max: 9)]
        
        let actual = input.mininumCover()
        let expected = [3, 6]
        XCTAssert(actual == expected || actual.count == expected.count)
    }

}
