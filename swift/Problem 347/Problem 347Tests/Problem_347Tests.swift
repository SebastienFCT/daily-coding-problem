//
//  Problem_347Tests.swift
//  Problem 347Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-06.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_347

class Problem_347Tests: XCTestCase {

    func test_example() {
        
        let input = "daily"
        let actual = input.lexicoMin(movingAnyOfTheFirsts: 1)
        let expected = "ailyd"
        
        XCTAssert(actual == expected)
    }

}
