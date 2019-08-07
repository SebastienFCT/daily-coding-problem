//
//  Problem_74Tests.swift
//  Problem 74Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-07.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_74

class Problem_74Tests: XCTestCase {

    func test_example() {
        let table = MultiplicationTable(length: 6)
        XCTAssert(table.countOccurence(value: 12) == 4)
    }

}
