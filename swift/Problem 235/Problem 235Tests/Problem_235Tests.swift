//
//  Problem_235Tests.swift
//  Problem 235Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-15.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_235

class Problem_235Tests: XCTestCase {

    func test_min_max() {
        
        var input: [Int] = []
        
        for _ in 1...100 {
            input.append(Int.random(in: -50...50))
        }
        
        let actual = input.minMax()
        
        XCTAssert(actual.comparisonCount <= 2*(input.count-2))
        XCTAssert(actual.min == input.min())
        XCTAssert(actual.max == input.max())
    }

}
