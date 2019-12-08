//
//  Problem_196Tests.swift
//  Problem 196Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-07.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_196

class Problem_196Tests: XCTestCase {

    func test_example() {
        let tree = Node(value: 5, left: Node(value: 2), right: Node(value: -5))
        
        XCTAssert(tree.mostFrequentSubtreeSum() == 2)
    }

}
