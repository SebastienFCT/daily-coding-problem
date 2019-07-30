//
//  Problem_65Tests.swift
//  Problem 65Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-29.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_65

class Problem_65Tests: XCTestCase {

    func test_example() {
        var input = [
            [1,  2,  3,  4,  5],
            [6,  7,  8,  9,  10],
            [11, 12, 13, 14, 15],
            [16, 17, 18, 19, 20]
        ]
        
        XCTAssert(input.clockWiseList() == [1,2,3,4,5,10,15,20,19,18,17,16,11,6,7,8,9,14,13,12])
    }

}
