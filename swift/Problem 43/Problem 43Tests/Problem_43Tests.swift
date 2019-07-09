//
//  Problem_43Tests.swift
//  Problem 43Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_43

class Problem_43Tests: XCTestCase {

    func test_1() {
        let stack = Stack()
        
        stack.push(value: 1)
        XCTAssert(stack.max() == 1)
        stack.pop()
        stack.push(value: 5)
        XCTAssert(stack.max() == 5)
        stack.push(value: 3)
        XCTAssert(stack.max() == 5)
        stack.push(value: 10)
        XCTAssert(stack.max() == 10)
        stack.push(value: 11)
        XCTAssert(stack.max() == 11)
        stack.push(value: 2)
        XCTAssert(stack.max() == 11)
        stack.pop()
        XCTAssert(stack.max() == 11)
        stack.pop()
        XCTAssert(stack.max() == 10)
        stack.pop()
        XCTAssert(stack.max() == 5)
        stack.pop()
        XCTAssert(stack.max() == 5)
        stack.pop()
        XCTAssert(stack.max() == nil)
    }

}
