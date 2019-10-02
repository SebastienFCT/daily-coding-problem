//
//  Problem_129Tests.swift
//  Problem 129Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-01.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_129

class Problem_129Tests: XCTestCase {

    func test_square_root() {
        XCTAssert(Float(exactly: 175)!.squareRoot().rounded() - Float(exactly: 175)!.findSquareRoot().rounded() <= 1)
        XCTAssert(Float(exactly: 22)!.squareRoot().rounded() - Float(exactly: 22)!.findSquareRoot().rounded() <= 1)
        XCTAssert(Float(exactly: 1223)!.squareRoot().rounded() - Float(exactly: 1223)!.findSquareRoot().rounded() <= 1)
    }

}
