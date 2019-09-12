//
//  Problem_110Tests.swift
//  Problem 110Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_110

class Problem_110Tests: XCTestCase {

    func test_simple_1() {
        let root = Node(value: 1, left: Node(value: 2, left: nil, right: nil), right: Node(value: 3, left: Node(value: 4, left: nil, right: nil), right: nil))
        XCTAssert(root.paths() ==  [[1, 2], [1, 3, 4]])
    }
    
    func test_example() {
        let root = Node(value: 1, left: Node(value: 2, left: nil, right: nil), right: Node(value: 3, left: Node(value: 4, left: nil, right: nil), right: Node(value: 5, left: nil, right: nil)))
        XCTAssert(root.paths() ==  [[1, 2], [1, 3, 4], [1, 3, 5]])
    }

}
