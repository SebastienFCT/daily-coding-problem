//
//  Problem_254Tests.swift
//  Problem 254Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-03.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_254

class Problem_254Tests: XCTestCase {

    func test_example() {
        
        let root = Node(value: 0)
        
        let l = Node(value: 1)
        let ll = Node(value: 3)
        let llr = Node(value: 5)
        
        ll.right = llr
        l.left = ll
        root.left = l
        
        let r = Node(value: 2)
        let rr = Node(value: 4)
        let rrl = Node(value: 6)
        let rrr = Node(value: 7)
        
        rr.left = rrl
        rr.right = rrr
        r.right = rr
        root.right = r
        
        let actual = root.toBinaryTree()
        
        XCTAssert(actual.value == 0)
        XCTAssert(actual.left?.value == 5)
        XCTAssertNil(actual.left?.left)
        XCTAssertNil(actual.left?.right)
        
        XCTAssert(actual.right?.value == 4)
        XCTAssert(actual.right?.left?.value == 6)
        XCTAssertNil(actual.right?.left?.left)
        XCTAssertNil(actual.right?.left?.right)
        XCTAssert(actual.right?.right?.value == 7)
        XCTAssertNil(actual.right?.right?.left)
        XCTAssertNil(actual.right?.right?.right)
    }

}
