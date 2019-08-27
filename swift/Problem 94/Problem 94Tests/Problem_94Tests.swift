//
//  Problem_94Tests.swift
//  Problem 94Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-27.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_94

class Problem_94Tests: XCTestCase {

    func test_1() {
        let tree = Node(val: 10, left: Node(val: 12, left: nil, right: nil), right: Node(val: 2, left: nil, right: nil))
        
        XCTAssert(tree.maxPathSum() == 22)
    }
    
    func test_2() {
        let tree = Node(val: 10, left: Node(val: 12, left: nil, right: nil), right: Node(val: 38, left: nil, right: nil))
        
        XCTAssert(tree.maxPathSum() == 48)
    }
    
    func test_3() {
        let tree = Node(val: 10, left: Node(val: 12, left: nil, right: Node(val: 38, left: nil, right: nil)), right: Node(val: 38, left: nil, right: nil))
        
        XCTAssert(tree.maxPathSum() == 50)
    }

}
