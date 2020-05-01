//
//  Problem_341Tests.swift
//  Problem 341Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-30.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_341

class Problem_341Tests: XCTestCase {

    func test_example() {
        
        let input: CharacterMatrix = [
            ["e", "a", "n"],
            ["t", "t", "i"],
            ["a", "r", "a"]
        ]
        
        let actual = input.maximize(forList: ["eat", "rain", "in", "rat"])
        let expected = 3
        
        XCTAssert(actual == expected)
    }

}
