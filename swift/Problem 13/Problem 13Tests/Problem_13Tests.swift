//
//  Problem_13Tests.swift
//  Problem 13Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_13

class Problem_13Tests: XCTestCase {

    func testExample() {
        let input = "abcba"
        let k = 2
        
        XCTAssert(input.findLargestSubstringWithMaximumDistinctCharacter(k) == "bcb")
    }

}
