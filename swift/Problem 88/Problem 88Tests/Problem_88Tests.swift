//
//  Problem_88Tests.swift
//  Problem 88Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_88

class Problem_88Tests: XCTestCase {

    func test_rounded() {
        let calculator = GoogleCalculator()
        XCTAssert(calculator.customQuotientDivision(dividend: 100, divisor: 10) == 10)
    }
    
    func test_notRounded() {
        let calculator = GoogleCalculator()
        XCTAssert(calculator.customQuotientDivision(dividend: 100, divisor: 33) == 3)
    }

}
