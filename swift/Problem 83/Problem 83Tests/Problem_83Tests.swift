//
//  Problem_83Tests.swift
//  Problem 83Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_83

class Problem_83Tests: XCTestCase {

    func test_example() {
        let tree = Node(value: "a", left: Node(value: "b", left: Node(value: "d", left: nil, right: nil), right: Node(value: "e", left: nil, right: nil)), right: Node(value: "c", left: nil, right: nil))
        
        tree.reverseChildren()
        
        XCTAssert(tree.left?.value == "c")
        XCTAssert(tree.right?.right?.value == "d")
    }

}
