//
//  Problem_228Tests.swift
//  Problem 228Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-08.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_228

class Problem_228Tests: XCTestCase {

    func test_example() {
        
        let actual = [10, 7, 76, 415].maximumConcat()
        let expected = 77641510
        
        XCTAssert(actual == expected)
    }

}
