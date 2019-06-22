//
//  Problem_26Tests.swift
//  Problem 26Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_26

class Problem_26Tests: XCTestCase {

    func test_1() {
        let node = Node(value: "0", node: Node(value: "1", node: Node(value: "2", node: Node(value: "3", node: Node(value: "4", node: Node(value: "5", node: nil))))))
        
        XCTAssert(node.getElementAt(3).value == "3")
        node.removeElementAt(3)
        XCTAssert(node.getElementAt(3).value == "4")
    }

}
