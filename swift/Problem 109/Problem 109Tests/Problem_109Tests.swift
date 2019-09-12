//
//  Problem_109Tests.swift
//  Problem 109Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_109

class Problem_109Tests: XCTestCase {

    func test_example_1() {
        let input: [Bit] = [1,0,1,0,1,0,1,0].toBitArray()
        XCTAssert(input.swapOddAndEven().toIntArray() == [0,1,0,1,0,1,0,1])
    }
    
    func test_example_2() {
        let input: [Bit] = [1,1,1,0,0,0,1,0].toBitArray()
        XCTAssert(input.swapOddAndEven().toIntArray() == [1,1,0,1,0,0,0,1])
    }

}
