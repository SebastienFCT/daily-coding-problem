//
//  Problem_333Tests.swift
//  Problem 333Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-22.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_333

class Problem_333Tests: XCTestCase {

    func test_find_celebrity() {
        
        let input = Party(relation: [
            "seb": ["john", "jane"],
            "john": ["jane"],
            "jane": []
        ])
        
        let actual = input.findCelebrity()
        let expected = "jane"
        
        XCTAssert(actual == expected)
    }

}
