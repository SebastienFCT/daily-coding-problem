//
//  Problem_36Tests.swift
//  Problem 36Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_36

class Problem_36Tests: XCTestCase {

    func test_1() {
        let input = Node(
            value: "root"
            , left: Node(value: "left", left: nil, right: nil)
            , right: Node(
                value: "right"
                , left: Node(
                    value: "right.left"
                    , left: nil
                    , right: Node(value: "right.left.right", left: nil, right: nil))
                , right: Node(
                    value: "right.right"
                    , left: Node(
                        value: "right.right.left"
                        , left: nil
                        , right: Node(value: "right.right.left.right", left: nil, right: nil))
                    , right: nil)))
        
        print(input.maxLengh())
    }
    
    func test_2() {
        let input = Node(
            value: "root"
            , left: Node(value: "left", left: nil, right: nil)
            , right: Node(
                value: "right"
                , left: Node(
                    value: "right.left"
                    , left: nil
                    , right: Node(value: "right.left.right", left: nil, right: nil))
                , right: Node(
                    value: "right.right"
                    , left: Node(
                        value: "right.right.left"
                        , left: nil
                        , right: Node(value: "right.right.left.right", left: nil, right: nil))
                    , right: nil)))
        
        XCTAssert(input.nextLargestNode()!.value == "right")
    }

}
