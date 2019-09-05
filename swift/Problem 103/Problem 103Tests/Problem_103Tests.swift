//
//  Problem_103Tests.swift
//  Problem 103Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_103

class Problem_103Tests: XCTestCase {

    func test_example() {
        let input = "figehaeci"
        let set: Set<Character> = ["a", "e", "i"]
        XCTAssert(input.subSequeceContaining(set: set) == "aeci")
    }

}
