//
//  Problem_246Tests.swift
//  Problem 246Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-26.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_246

class Problem_246Tests: XCTestCase {

    func test_example() {
        let input = ["chair", "height", "racket", "touch", "tunic"]
        
        XCTAssertTrue(input.canCircle())
    }

}
