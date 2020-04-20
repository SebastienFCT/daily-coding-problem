//
//  Problem_330Tests.swift
//  Problem 330Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-19.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_330

class Problem_330Tests: XCTestCase {

    func test_example() {
        
        let actual = "(¬c OR b) AND (b OR c) AND (¬b OR c) AND (¬c OR ¬a)".solve2Cnf()
        let expected: [Character: Bool] = ["c": true, "a": false, "b": true]
        
        XCTAssert(actual == expected)
    }

}
