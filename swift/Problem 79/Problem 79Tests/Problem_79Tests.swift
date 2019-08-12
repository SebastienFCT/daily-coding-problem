//
//  Problem_79Tests.swift
//  Problem 79Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_79

class Problem_79Tests: XCTestCase {

    func test_example() {
        let input = [10, 5, 7]
        XCTAssert(input.nonDecreasingByRemovingOneElement() == (true, 0))
    }
    
    func test_example2() {
        let input = [10, 5, 1]
        XCTAssert(input.nonDecreasingByRemovingOneElement().success == false)
    }

}
