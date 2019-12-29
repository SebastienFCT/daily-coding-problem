//
//  Problem_218Tests.swift
//  Problem 218Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-29.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_218

class Problem_218Tests: XCTestCase {

    func test_example() {
        let current = Node(value: "A", next: Node(value: "B", next: Node(value: "C")))
        let reversed = current.reverse()
        
        let expected = "C->B->A"
        let actual = reversed.view
        
        XCTAssert(actual == expected)
    }

}
