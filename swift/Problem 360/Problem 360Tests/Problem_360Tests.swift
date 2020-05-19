//
//  Problem_360Tests.swift
//  Problem 360Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-19.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_360

class Problem_360Tests: XCTestCase {

    func test_example() {
        let input: [[Int]] = [[1, 7, 3], [2, 1, 6, 7, 9], [3, 9, 5]]
        
        let actual = input.spotifySorting()
        let expected = [2, 1, 6, 7, 3, 9, 5]
        
        XCTAssert(expected == actual)
    }

}
