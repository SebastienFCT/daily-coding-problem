//
//  Problem_307Tests.swift
//  Problem 307Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-27.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_307

class Problem_307Tests: XCTestCase {

    func test_tree_floor_and_ceil() {
        
        let root = Node(value: 8
            , left: Node(value: 3
                , left: Node(value: 1)
                , right: Node(value: 6
                    , left: Node(value: 4)
                    , right: Node(value: 7)
                )
            )
            , right: Node(value: 10
                , left: nil
                , right: Node(value: 14, left: Node(value: 13), right: nil)
            )
        )
        
        let bt = Tree(root: root)
        
        let actual = bt.floorAndCeiling(value: 6)
        XCTAssert(actual.floor?.value == 3)
        XCTAssert(actual.ceil?.value == 13)
    }

}
