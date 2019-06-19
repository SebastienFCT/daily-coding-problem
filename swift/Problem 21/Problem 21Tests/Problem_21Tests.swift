//
//  Problem_21Tests.swift
//  Problem 21Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_21

class Problem_21Tests: XCTestCase {

    func testExample() {
        let input: [(Int, Int)] = [(30, 75), (0, 50), (60, 150)]
        XCTAssert(input.minimumRoomRequired() == 2)
    }
    
    func test2() {
        let input: [(Int, Int)] = [(1, 2), (1, 3), (2, 3), (4, 5)]
        XCTAssert(input.minimumRoomRequired() == 3)
    }

    func test3() {
        let input: [(Int, Int)] = [(1, 2), (1, 3), (2, 3), (3, 5)]
        XCTAssert(input.minimumRoomRequired() == 3)
    }
}
