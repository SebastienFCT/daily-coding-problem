//
//  Problem_327Tests.swift
//  Problem 327Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-16.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_327

class Problem_327Tests: XCTestCase {

    func test_merge_trees() {
        
        let left = Node(value: 1
            , left: Node(value: 2
                , left: Node(value: 3)
                , right: nil)
            , right: Node(value: 5
                , left: Node(value: 2)
                , right: Node(value: 1))
        )
        
        let right = Node(value: 1
            , left: Node(value: 2
                , left: Node(value: 3)
                , right: nil)
            , right: Node(value: 5
                , left: Node(value: 2)
                , right: Node(value: 1))
        )
        
        let actual = left.merge(withTree: right)
        
        XCTAssert(actual?.value == 2)
        XCTAssert(actual?.left?.value == 4)
        XCTAssert(actual?.left?.left?.value == 6)
        XCTAssert(actual?.left?.right?.value == nil)
    }

}
