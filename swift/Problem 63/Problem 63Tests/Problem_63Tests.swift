//
//  Problem_63Tests.swift
//  Problem 63Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-27.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_63

class Problem_63Tests: XCTestCase {

    func test_example() {
        let input = [
            ["F", "A", "C", "I"],
            ["O", "B", "Q", "P"],
            ["A", "N", "O", "B"],
            ["M", "A", "S", "S"]
        ]
        
        XCTAssert(input.has(word: "FOAM") == true)
    }
    
    func test_example2() {
        let input = [
            ["F", "A", "C", "I"],
            ["O", "B", "Q", "P"],
            ["A", "N", "O", "B"],
            ["M", "A", "S", "S"]
        ]
        
        XCTAssert(input.has(word: "MASS") == true)
    }
    
    func test_example3() {
        let input = [
            ["F", "A", "C", "I"],
            ["O", "B", "Q", "P"],
            ["A", "N", "O", "B"],
            ["M", "A", "S", "S"]
        ]
        
        XCTAssert(input.has(word: "USER") == false)
    }

}
