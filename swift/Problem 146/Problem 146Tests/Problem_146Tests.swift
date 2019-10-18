//
//  Problem_146Tests.swift
//  Problem 146Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_146

class Problem_146Tests: XCTestCase {

    func test_example() {
        let root = Node(value: 0)
        
        let l = Node(value: 1)
        root.left = l
        
        let r = Node(value: 0)
        root.right = r
        
        let rl = Node(value: 1)
        r.left = rl
        
        let rr = Node(value: 0)
        r.right = rr
        
        let rrl = Node(value: 0)
        rr.left = rrl
        
        let rrr = Node(value: 0)
        rr.right = rrr
        
        XCTAssert(root.left?.value == 1)
        XCTAssert(root.right?.value == 0)
        XCTAssert(root.right?.right?.value == 0)
        
        let pruned = root.prune()
        
        XCTAssert(pruned?.value == root.value)
        XCTAssert(pruned?.left?.value == 1)
        XCTAssert(pruned?.right?.value == 0)
        XCTAssert(pruned?.right?.right?.value == nil)
    }

}
