//
//  Problem_156Tests.swift
//  Problem 156Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_156

class Problem_156Tests: XCTestCase {

    func test_example() {
        XCTAssert(FacebookChallenge().smallestNumberOfSquaredInteger(target: 13) == 3)
    }

}
