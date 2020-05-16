//
//  Problem_357Tests.swift
//  Problem 357Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-16.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_357

class Problem_357Tests: XCTestCase {

    func test_example() {
        
        XCTAssert("(00)".treeDepth() == 0)
        XCTAssert("((00)(00))".treeDepth() == 1)
        XCTAssert("((((00)0)0)0)".treeDepth() == 3)
    }

}
