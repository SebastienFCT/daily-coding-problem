//
//  Problem_269Tests.swift
//  Problem 269Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-18.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_269

class Problem_269Tests: XCTestCase {

    func test_example_1() {
        let input: [Character] = [".", "L", ".", "R", ".", ".", ".", ".", "L"]
        let expected: [Character] = ["L", "L", ".", "R", "R", "R", "L", "L", "L"]
        let actual = input.dominos()
        
        XCTAssert(actual == expected)
    }
    
    func test_example_2() {
        let input: [Character] = [".", ".", "R", ".", ".", ".", "L", ".", "L"]
        let expected: [Character] = [".", ".", "R", "R", ".", "L", "L", "L", "L"]
        let actual = input.dominos()
        
        XCTAssert(actual == expected)
    }

}
