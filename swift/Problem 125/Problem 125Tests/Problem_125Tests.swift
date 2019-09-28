//
//  Problem_125Tests.swift
//  Problem 125Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-27.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_125

class Problem_125Tests: XCTestCase {

    func test_example() {
        let root = Node(value: 10)
        let l = Node(value: 5)
        let r = Node(value: 15)
        let rl = Node(value: 11)
        let rr = Node(value: 15)
        
        root.left = l
        root.right = r
        
        r.left = rl
        r.right = rr
        
        let current = root.paidForSum(20)
        XCTAssert(current?.count == 2)
        XCTAssert(current![0].value + current![1].value == 20)
    }

}
