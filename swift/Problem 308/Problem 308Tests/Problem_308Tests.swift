//
//  Problem_308Tests.swift
//  Problem 308Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-28.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_308

class Problem_308Tests: XCTestCase {

    func test_example() {
        
        let expression: [Character] = ["F", "|", "T", "&", "T"]
        let input = Quantcast(expression: expression)
        
        let actual = input.countForTrueResult()
        let expected = 2
        
        XCTAssert(actual == expected)
    }

}
