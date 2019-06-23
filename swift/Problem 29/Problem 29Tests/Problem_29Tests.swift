//
//  Problem_29Tests.swift
//  Problem 29Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_29

class Problem_29Tests: XCTestCase {

    func test_example() {
        var input = "AAAABBBCCDAA"
        var serialized = input.serialize()
        
        XCTAssert(serialized == "4A3B2C1D2A")
        XCTAssert(serialized.deserialize() == "AAAABBBCCDAA")
    }

}
