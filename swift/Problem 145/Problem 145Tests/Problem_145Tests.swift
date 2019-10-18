//
//  Problem_145Tests.swift
//  Problem 145Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_145

class Problem_145Tests: XCTestCase {

    func test_example() {
        let list = Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: nil))))
        
        XCTAssert(list.toString() == "1->2->3->4")
        let swapped = list.swapPairs()
        XCTAssert(swapped?.toString() == "2->1->4->3")
    }

}
