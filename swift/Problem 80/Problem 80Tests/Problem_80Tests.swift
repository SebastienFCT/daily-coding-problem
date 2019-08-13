//
//  Problem_80Tests.swift
//  Problem 80Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_80

class Problem_80Tests: XCTestCase {

    func test_example() {
        let input = Node(value: "a", left: Node(value: "b", left: Node(value: "d", left: nil, right: nil), right: nil), right: Node(value: "c", left: nil, right: nil))
        
        XCTAssert(input.findDeepestNode().node.value == "d")
        XCTAssert(input.findDeepestNode().level == 2)
    }

}
