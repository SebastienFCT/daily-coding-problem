//
//  Problem_35Tests.swift
//  Problem 35Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-29.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_35

class Problem_35Tests: XCTestCase {

    func testExample() {
        var input: [Character] =  ["G", "B", "R", "R", "B", "R", "G"]
        _ = input.RGB()
        XCTAssert(input == ["R", "R", "G", "G", "G", "B", "B"])
    }

}
