//
//  Problem_93Tests.swift
//  Problem 93Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_93

class Problem_93Tests: XCTestCase {

    func test_simple_tree() {
        let tree = Node(
            value: 10
            , left: Node(
                value: 9
                , left: nil
                , right: nil)
            , right: Node(
                value: 11
                , left: nil
                , right: Node(
                    value: 12
                    , left: nil
                    , right: nil
                )
            )
        )
        XCTAssert(tree.largestBstSize() == 4)
        
        let tree2 = Node(
            value: 10
            , left: Node(
                value: 9
                , left: nil
                , right: nil)
            , right: Node(
                value: 11
                , left: nil
                , right: Node(
                    value: 8
                    , left: nil
                    , right: nil
                )
            )
        )
        XCTAssert(tree2.largestBstSize() == 3)
    }
    
    func test_multiple_level() {
        let tree = Node(
            value: 5
            , left: Node(
                value: 10
                , left: nil
                , right: nil)
            , right: Node(
                value: 4
                , left: Node(value: 3
                    , left: nil
                    , right: nil)
                , right: Node(value: 5
                    , left: nil
                    , right: nil
                )
            )
        )
        XCTAssert(tree.largestBstSize() == 3)
    }

}
