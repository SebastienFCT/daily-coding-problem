//
//  Problem_5Tests.swift
//  Problem 5Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_5

class Problem_5Tests: XCTestCase {

    func testExample() {
        XCTAssert(car(Cons(a: 3, b: 4)) == 3)
        XCTAssert(cdr(Cons(a: 3, b: 4)) == 4)
    }

}
