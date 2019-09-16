//
//  Problem_113Tests.swift
//  Problem 113Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-15.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_113

class Problem_113Tests: XCTestCase {

    func test_reverse() {
        XCTAssert("Hello Green World".reverseWords() == "World Green Hello")
    }

}
