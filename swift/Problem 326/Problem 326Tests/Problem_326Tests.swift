//
//  Problem_326Tests.swift
//  Problem 326Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-15.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_326

class Problem_326Tests: XCTestCase {

    func test_example() {
        
        let tree = [3, 2, 6, 1, 9].toTree(next: nil)
        
        XCTAssert(tree?.value == 1)
        XCTAssert(tree?.left?.value == 2)
        XCTAssert(tree?.right?.value == 9)
        XCTAssert(tree?.left?.left?.value == 3)
        XCTAssert(tree?.left?.right?.value == 6)
    }

}
