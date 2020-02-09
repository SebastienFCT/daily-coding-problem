//
//  Problem_259Tests.swift
//  Problem 259Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-08.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_259

class Problem_259Tests: XCTestCase {

    func test_example() {
        
        let input = ["cat", "calf", "dog", "bear"]
        let expected = "b"
        let actual = input.optimalStartForGhost()
        
        XCTAssert(actual == expected)
    }

}
