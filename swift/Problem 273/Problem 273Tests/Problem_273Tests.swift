//
//  Problem_273Tests.swift
//  Problem 273Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-24.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_273

class Problem_273Tests: XCTestCase {

    func test_example_1() {
        
        let input = FixedPoint(input: [-6, 0, 2, 40])
        let expected = 2
        let actual = input.anyFixedPoint()
        
        XCTAssert(actual as? Int == expected)
    }
    
    func test_example_2() {
        
        let input = FixedPoint(input: [1, 5, 7, 8])
        let expected = false
        let actual = input.anyFixedPoint()
        
        XCTAssert(actual as? Bool == expected)
    }

}
