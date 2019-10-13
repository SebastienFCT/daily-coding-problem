//
//  Problem_141Tests.swift
//  Problem 141Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_141

class Problem_141Tests: XCTestCase {

    func test_stack() {
        var stack = Stack(list: [])
        
        stack.push(item: "Test", stack_number: 0)
        XCTAssert(stack.list[0][0] as? String == "Test")
        
        stack.push(item: 1, stack_number: 2)
        XCTAssert(stack.list[1].isEmpty)
        XCTAssert(!stack.list[2].isEmpty)
        XCTAssert(stack.list[2][0] as? Int == 1)
        
        stack.push(item: 5, stack_number: 2)
        XCTAssert(stack.list[2][1] as? Int == 5)
        
        stack.pop(stack_number: 2)
        XCTAssert(stack.list[2].count == 1)
    }

}
