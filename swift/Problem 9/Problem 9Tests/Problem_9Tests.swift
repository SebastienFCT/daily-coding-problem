//
//  Problem_9Tests.swift
//  Problem 9Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_9

class Problem_9Tests: XCTestCase {

    func testExample() {
        let input = [2, 4, 6, 2, 5]
        XCTAssert(input.largestSumWithNonAdjacent() == 13)
    }
    
    func testExample2() {
        let input = [5, 1, 1, 5]
        XCTAssert(input.largestSumWithNonAdjacent() == 10)
    }
    
    func test3() {
        let input = [5, 6, 2, 6, 5]
        XCTAssert(input.largestSumWithNonAdjacent() == 12)
    }
    
    func test4() {
        let input = [1, 2, 2, 1, 2, 1]
        print(input.largestSumWithNonAdjacent())
        XCTAssert(input.largestSumWithNonAdjacent() == 5)
    }

}
