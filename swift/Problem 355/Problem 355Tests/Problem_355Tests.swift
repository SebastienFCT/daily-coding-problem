//
//  Problem_355Tests.swift
//  Problem 355Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-14.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_355

class Problem_355Tests: XCTestCase {

    func test_example() {
        let input: [Double] = [1.3, 2.3, 4.4]
        
        let actual = input.roundedArrayWithSmallerPairwiseDiff()
        let expected = [1, 2, 5]
        
        XCTAssert(actual == expected)
    }

}
