//
//  Problem_20Tests.swift
//  Problem 20Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_20

class Problem_20Tests: XCTestCase {

    func test() {
        let input1 = Node(value: 3, next: Node(value: 7, next: Node(value: 8, next: Node(value: 10, next: nil))))
        let input2 = Node(value: 99, next: Node(value: 1, next: Node(value: 8, next: Node(value: 10, next: nil))))
        
        XCTAssert(commonNode(lhs: input1, rhs: input2)!.value == 8)
    }

}
