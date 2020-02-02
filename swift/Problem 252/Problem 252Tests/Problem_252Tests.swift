//
//  Problem_252Tests.swift
//  Problem 252Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-01.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_252

class Problem_252Tests: XCTestCase {

    func test_example() {
        
        let em = EgyptianMaths()
        let actual = em.convertFraction(fraction: (4, 13))
        
        XCTAssert(actual.count == 3)
        XCTAssert(actual[0] == (1, 4))
        XCTAssert(actual[1] == (1, 18))
        XCTAssert(actual[2] == (1, 468))
    }

}
