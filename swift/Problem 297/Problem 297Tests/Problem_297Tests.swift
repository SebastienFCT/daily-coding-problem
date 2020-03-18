//
//  Problem_297Tests.swift
//  Problem 297Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-17.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_297

class Problem_297Tests: XCTestCase {

    func test_example() {
        
        let input = Bar(preferences: [
            0: [0, 1, 3, 6],
            1: [1, 4, 7],
            2: [2, 4, 7, 5],
            3: [3, 2, 5],
            4: [5, 8]
        ])
        
        let actual = input.lazyBartender()
        
        XCTAssert(actual.count == 2)
        XCTAssert(actual.contains(1))
        XCTAssert(actual.contains(5))
    }

}
