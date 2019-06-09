//
//  Problem_2Tests.swift
//  Problem 2Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_2

class Problem_2Tests: XCTestCase {

    func testExample() {
        let input = [1, 2, 3, 4, 5]
        
        XCTAssert(input.productOfOthers() == [120, 60, 40, 30, 24])
        XCTAssert(input.productOfOtherWithoutDivision() == [120, 60, 40, 30, 24])
    }
    
    func testExample2() {
        let input = [3, 2, 1]
        
        XCTAssert(input.productOfOthers() == [2, 3, 6])
        XCTAssert(input.productOfOtherWithoutDivision() == [2, 3, 6])
    }

}
