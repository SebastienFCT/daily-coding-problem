//
//  Problem_305Tests.swift
//  Problem 305Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-25.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_305

class Problem_305Tests: XCTestCase {

    func test_example() {
        let ll = LinkedList(root: Node(value: 3, next: Node(value: 4, next: Node(value: -7, next: Node(value: 5, next: Node(value: -6, next: Node(value: 6, next: nil)))))))
        
        XCTAssert(ll.removeConsecutiveNodesWithZeroSum() == "5")
    }

}
