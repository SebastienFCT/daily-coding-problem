//
//  Problem_106Tests.swift
//  Problem 106Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_106

class Problem_106Tests: XCTestCase {

    func test_example_1() {
        let input = [2, 0, 1, 0]
        XCTAssert(input.canHopToTheEnd() == true)
    }
    
    func test_example_2() {
        let input = [1, 1, 0, 1]
        XCTAssert(input.canHopToTheEnd() == false)
    }

}
