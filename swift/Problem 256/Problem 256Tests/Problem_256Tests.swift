//
//  Problem_256Tests.swift
//  Problem 256Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-05.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_256

class Problem_256Tests: XCTestCase {

    func test_example() {
        let root = Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: Node(value: 5)))))
     
        XCTAssert(root.forPrinting() == "1->2->3->4->5")
        XCTAssert(root.alternateValues().forPrinting() == "1->3->2->5->4")
    }
    
    func test_example_2() {
        let root = Node(value: 4, next: Node(value: 1, next: Node(value: 3, next: Node(value: 2, next: Node(value: 5)))))
     
        XCTAssert(root.forPrinting() == "4->1->3->2->5")
        XCTAssert(root.alternateValues().forPrinting() == "1->3->2->5->4")
    }

}
