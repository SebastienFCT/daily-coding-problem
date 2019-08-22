//
//  Problem_89Tests.swift
//  Problem 89Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_89

class Problem_89Tests: XCTestCase {

    func test_validTree() {
        let tree = Node(value: 0, left: Node(value: -1, left: Node(value: -2, left: nil, right: nil), right: nil), right: Node(value: 1, left: nil, right: Node(value: 2, left: nil, right: nil)))
        
        XCTAssert(tree.isValidBinaryTree() == true)
    }
    
    func test_invalidTree() {
        let tree = Node(value: 0, left: Node(value: -1, left: Node(value: -2, left: nil, right: nil), right: nil), right: Node(value: 1, left: nil, right: Node(value: -5, left: nil, right: nil)))
        
        XCTAssert(tree.isValidBinaryTree() == false)
    }

}
