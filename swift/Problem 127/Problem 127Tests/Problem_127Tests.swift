//
//  Problem_127Tests.swift
//  Problem 127Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-29.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_127

class Problem_127Tests: XCTestCase {

    func test_example() {
        let left = Node(value: 9, child: Node(value: 9, child: nil))
        let right = Node(value: 5, child: Node(value: 2, child: nil))
        
        let sum = left + right
        XCTAssert(sum.values() == [4, 2, 1])
    }

}
