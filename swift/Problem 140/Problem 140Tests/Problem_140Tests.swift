//
//  Problem_140Tests.swift
//  Problem 140Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_140

class Problem_140Tests: XCTestCase {

    func test_example() {
        let input = [2, 4, 6, 8, 10, 2, 6, 10]
        XCTAssert(input.findSingles() == [8, 4])
    }

}
