//
//  Problem_8Tests.swift
//  Problem 8Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_8

class Problem_8Tests: XCTestCase {

    func testExample() {
        let tree = Node(val: 0, left: Node(val: 1), right: Node(val: 0, left: Node(val: 1, left: Node(val: 1), right: Node(val: 1)), right: Node(val: 0)))
        XCTAssert(tree.countUnival() == 5)
    }

}
