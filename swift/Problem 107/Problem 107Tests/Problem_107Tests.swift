//
//  Problem_107Tests.swift
//  Problem 107Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_107

class Problem_107Tests: XCTestCase {

    func test_example() {
        let root = Node<Int>(value: 1, left: Node<Int>(value: 2, left: nil, right: nil), right: Node<Int>(value: 3, left: Node<Int>(value: 4, left: nil, right: nil), right: Node<Int>(value: 5, left: nil, right: nil)))
        _ = root.printTree()
    }

}
