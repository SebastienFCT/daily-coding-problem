//
//  Problem_180Tests.swift
//  Problem 180Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_180

class Problem_180Tests: XCTestCase {

    func test_example_1() {
        var stack = Stack(value: [1, 2, 3, 4, 5])
        stack.interleave()
        
        XCTAssert(stack.value == [1, 5, 2, 4, 3])
    }
    
    func test_example_2() {
        var stack = Stack(value: [1, 2, 3, 4])
        stack.interleave()
        
        XCTAssert(stack.value == [1, 4, 2, 3])
    }

}
