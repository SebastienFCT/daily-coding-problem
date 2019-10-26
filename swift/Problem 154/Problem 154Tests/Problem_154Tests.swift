//
//  Problem_154Tests.swift
//  Problem 154Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_154

class Problem_154Tests: XCTestCase {

    func test_stack() {
        let stack = Stack()
        
        stack.push(item: 0)
        stack.push(item: 1)
        stack.push(item: 2)
        
        XCTAssert(stack.pop() == 2)
        
        stack.push(item: 3)
        stack.push(item: -1)
        
        XCTAssert(stack.pop() == -1)
        XCTAssert(stack.pop() == 3)
    }

}
