//
//  Problem_248Tests.swift
//  Problem 248Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-28.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_248

class Problem_248Tests: XCTestCase {

    func test_max() {
        
        let expected = 23
        let actual = max(left: 23, right: 21)
        
        XCTAssert(expected == actual)
    }
    
    func test_max_2() {

        let expected = 23
        let actual = max(left: 21, right: 23)

        XCTAssert(expected == actual)
    }

    func test_max_3() {

        let expected = 2
        let actual = max(left: 2, right: -10)

        XCTAssert(expected == actual)
    }
    
    func test_max_4() {

        let expected = -2
        let actual = max(left: -2, right: -10)

        XCTAssert(expected == actual)
    }

}
