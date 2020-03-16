//
//  Problem_296Tests.swift
//  Problem 296Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-16.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_296

class Problem_296Tests: XCTestCase {

    func test_height_balanced_binary_tree_builder() {
        
        let input = [1, 2, 3, 4, 5, 6]
        XCTAssert(input.heightBalancedBinaryTree().toString() == "4 -> 2 -> 1 -> 6 -> 5")
        
        let input2 = [1, 2, 3, 4, 5, 6, 7]
        XCTAssert(input2.heightBalancedBinaryTree().toString() == "4 -> 2 -> 1 -> 3 -> 6 -> 5 -> 7")
    }

}
