//
//  Problem_343Tests.swift
//  Problem 343Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-03.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_343

class Problem_343Tests: XCTestCase {

    func test_example() {
        
        let input = Node(value: 5
            , left: Node(value: 3
                , left: Node(value: 2, left: nil, right: nil)
                , right: Node(value: 4, left: nil, right: nil))
            , right: Node(value: 8
                , left: Node(value: 6, left: nil, right: nil)
                , right: Node(value: 10, left: nil, right: nil)))
        
        let actual = input.sum(forRange: 4...9)
        let expected = 23
        
        XCTAssert(actual == expected)
    }

}
