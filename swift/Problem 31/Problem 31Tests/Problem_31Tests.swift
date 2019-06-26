//
//  Problem_31Tests.swift
//  Problem 31Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-25.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_31

class Problem_31Tests: XCTestCase {

    func test_1() {
        let input = "hello world"
        print(input.closestSubString(toExpectedOutput: "ld"))
    }
    
    func test_2() {
        let input = "kitten"
        print(input.editDistance(toOutput: "sitting"))
    }
}
