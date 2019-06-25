//
//  Problem_30Tests.swift
//  Problem 30Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-24.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_30

class Problem_30Tests: XCTestCase {

    func test_1() {
        let input1 = [2, 0, 4, 0, 4, 1, 2]
        XCTAssert(input1.findDeepestValley().subArray == [4, 0, 4])
        
        
        let input2 = [4, 4]
        XCTAssert(input2.findDeepestValley().subArray == [4, 4])
    }

    func test_2() {
        let input1 = [4, 0, 4]
        XCTAssert(input1.fill() == (4, 4))
        
        let input2 = [4, 4]
        XCTAssert(input2.fill() == (0, 4))
    }
    
    func test_3() {
        var input1 = [2, 0, 4, 0, 4, 1, 2]
        XCTAssert(input1.rain() == 7)
    }
    
    func test_example() {
        var input1 = [2, 1, 2]
        XCTAssert(input1.rain() == 1)
        
        var input2 = [3, 0, 1, 3, 0, 5]
        XCTAssert(input2.rain() == 8)
    }
}
