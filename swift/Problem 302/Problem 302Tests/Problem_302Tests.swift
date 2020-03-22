//
//  Problem_302Tests.swift
//  Problem 302Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-22.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_302

class Problem_302Tests: XCTestCase {

    func test_example() {
        
        let input: [[Character]] = [
            ["\\", " ", " ", " ", " ", "/"],
            [" ", "\\", " ", " ", "/", " "],
            [" ", " ", "\\", "/", " ", " "]
        ]
        
        XCTAssert(input.countRegion() == 3)
    }

}
