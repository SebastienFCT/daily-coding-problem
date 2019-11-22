//
//  Problem_181Tests.swift
//  Problem 181Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_181

class Problem_181Tests: XCTestCase {

    func test_example_1() {
        XCTAssert("racecarannakayak".splitInPalindromes() == ["racecar", "anna", "kayak"])
    }
    
    func test_example_2() {
        XCTAssert("abc".splitInPalindromes() == ["a", "b", "c"])
    }

}
