//
//  Problem_211Tests.swift
//  Problem 211Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_211

class Problem_211Tests: XCTestCase {

    func test_example() {
        let input = "abracadabra"
        let expected = [0, 7]
        let actual = input.indexes(forSubstring: "abr")
        
        XCTAssert(actual == expected)
    }

}
