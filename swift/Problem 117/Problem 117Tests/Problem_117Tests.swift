//
//  Problem_117Tests.swift
//  Problem 117Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-19.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_117

class Problem_117Tests: XCTestCase {

    func test_node_minimum_sum() {
        let root = Node(value: 0)
        let l = Node(value: -1)
        let ll = Node(value: 10)
        let lr = Node(value: -5)
        let r = Node(value: 2)
        let rl = Node(value: 1)
        let rr = Node(value: -2)
        
        root.left = l
        root.right = r
        
        l.left = ll
        l.right = lr
        
        r.left = rl
        r.right = rr
        
        XCTAssert(root.minimumSum(currentLevel: 0, currentSum: root.value) == (level: 2, sum: -6))
    }

}
