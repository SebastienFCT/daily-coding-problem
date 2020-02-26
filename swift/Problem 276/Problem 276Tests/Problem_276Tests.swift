//
//  Problem_276Tests.swift
//  Problem 276Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-25.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_276

class Problem_276Tests: XCTestCase {

    func test_find_pattern_1() {
        
        let input = "the red fox jumped over the lazy dog"
        let expected = [4]
        let actual = input.find(pattern: "red")
        
        XCTAssert(actual == expected)
    }
    
    func test_find_pattern_2() {
        
        let input = "the red fox jumped over the red dog"
        let expected = [4, 28]
        let actual = input.find(pattern: "red")
        
        XCTAssert(actual == expected)
    }

}
