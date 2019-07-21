//
//  Problem_57Tests.swift
//  Problem 57Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_57

class Problem_57Tests: XCTestCase {

    func test_example() {
        let input = "the quick brown fox jumps over the lazy dog"
        
        XCTAssert(input.distribute(k: 10) == ["the quick", "brown fox", "jumps over", "the lazy", "dog"])
    }

}
