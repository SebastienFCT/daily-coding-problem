//
//  Problem_177Tests.swift
//  Problem 177Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_177

class Problem_177Tests: XCTestCase {

    func test_example() {
        let ll1 = Node(value: 7, next: Node(value: 7, next: Node(value: 3, next: Node(value: 5, next: nil))))
        XCTAssert(ll1.rotate(by: 2).value == 3)
        
        let ll2 = Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: Node(value: 5, next: nil)))))
        XCTAssert(ll2.rotate(by: 3).value == 3)
    }

}
