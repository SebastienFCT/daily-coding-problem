//
//  Problem_169Tests.swift
//  Problem 169Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_169

class Problem_169Tests: XCTestCase {

    func test_example() {
        let ll = Node(value: 4, next: Node(value: 1, next: Node(value: -3, next: Node(value: 99, next: nil))))
        XCTAssert(ll.sort()?.printList() == "-3->1->4->99")
    }

}
