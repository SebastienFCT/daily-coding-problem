//
//  Problem_208Tests.swift
//  Problem 208Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-19.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_208

class Problem_208Tests: XCTestCase {

    func test_example() {
        let ll = Node(value: 5, next: Node(value: 1, next: Node(value: 8, next: Node(value: 0, next: Node(value: 3)))))
        
        XCTAssert(ll.partition(by: 3)!.printList() == "0->1->5->8->3")
    }

}
