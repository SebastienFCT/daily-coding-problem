//
//  Problem_320Tests.swift
//  Problem 320Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-09.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_320

class Problem_320Tests: XCTestCase {

    func test_example() {
        
        let input = "jiujitsu"
        
        let actual = input.smallestWindowWithAllDistinctCharacters()
        let expected = 5
        
        XCTAssert(actual == expected)
    }

}
