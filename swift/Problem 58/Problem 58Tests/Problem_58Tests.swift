//
//  Problem_58Tests.swift
//  Problem 58Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_58

class Problem_58Tests: XCTestCase {

    func test_example() {
        let input = [13, 18, 25, 2, 8, 10]
        XCTAssert(input.findIndex(8)?.index == 4)


        XCTAssert(input.findIndex(0)?.index == nil)
        XCTAssert(input.findIndex(10)?.index == 5)
        XCTAssert(input.findIndex(25)?.index == 2)
        
    }

}
