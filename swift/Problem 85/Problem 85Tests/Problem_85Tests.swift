//
//  Problem_85Tests.swift
//  Problem 85Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_85

class Problem_85Tests: XCTestCase {

    func test_binarySelection() {
        XCTAssert(FacebookChallenge.binarySelection(x: 10, y: 20, b: 0) == 20)
        XCTAssert(FacebookChallenge.binarySelection(x: 10, y: 20, b: 1) == 10)
        
        XCTAssert(FacebookChallenge.binarySelection(x: 12764, y: 87364, b: 0) == 87364)
        XCTAssert(FacebookChallenge.binarySelection(x: 456, y: 123556, b: 1) == 456)
    }

}
