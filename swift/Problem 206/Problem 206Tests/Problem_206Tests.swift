//
//  Problem_206Tests.swift
//  Problem 206Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_206

class Problem_206Tests: XCTestCase {

    func test_example() {
        var current = ["a", "b", "c"]
        current.applyPermutation(permutation: [2, 1, 0])
        
        let expected = ["c", "b", "a"]
            
        XCTAssert(current == expected)
    }

}
