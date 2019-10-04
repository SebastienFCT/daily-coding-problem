//
//  Problem_131Tests.swift
//  Problem 131Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-03.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_131

class Problem_131Tests: XCTestCase {

    func test_deep_copy() {
        let root = Node(value: 0)
        let one = Node(value: 1)
        let two = Node(value: 2)
        
        root.rand = two
        one.rand = two
        two.rand = one
        
        root.next = one
        one.next = two
        
        let copy = root.deepCopy(nodes: [:], rootKey: nil)
        XCTAssert(root.values() == copy.values())
    }

}
