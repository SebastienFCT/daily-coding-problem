//
//  Problem_102Tests.swift
//  Problem 102Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-04.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_102

class Problem_102Tests: XCTestCase {

    func test_example() {
        let input = [1, 2, 3, 4, 5]
        XCTAssert(input.contiguousElement(forSum: 9) == [2, 3, 4])
    }
    
    func test_other() {
        let input = [1,2,3,4,5,6]
        XCTAssert(input.contiguousElement(forSum: 3) == [1, 2])
        XCTAssert(input.contiguousElement(forSum: 2) == [2])
        XCTAssert(input.contiguousElement(forSum: 100) == [])
    }

}
