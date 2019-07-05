//
//  Problem_40Tests.swift
//  Problem 40Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-04.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_40

class Problem_40Tests: XCTestCase {

    func test_1() {
        let input = [6, 1, 3, 3, 3, 6, 6]
        XCTAssert(input.findUniqueOccurence(regularOccurence: 3) == 1)
    }
    
    func test_2() {
        let input = [13, 19, 13, 13]
        XCTAssert(input.findUniqueOccurence(regularOccurence: 3) == 19)
    }

}
