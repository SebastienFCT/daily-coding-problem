//
//  Problem_288Tests.swift
//  Problem 288Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-08.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_288

class Problem_288Tests: XCTestCase {

    func test_example() {
        
        let kaprekar = Kaprekar()
        
        let actual = kaprekar.countStepsTo6174(from: 1234)
        let expected = 3
        
        XCTAssert(actual == expected)
    }

}
