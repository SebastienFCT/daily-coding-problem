//
//  Problem_142Tests.swift
//  Problem 142Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_142

class Problem_142Tests: XCTestCase {

    func test_example() {
        let input1 = "(()*"
        XCTAssertTrue(input1.isBalanced())
        
        let input2 = "(*)"
        XCTAssertTrue(input2.isBalanced())
        
        let input3 = ")*("
        XCTAssertFalse(input3.isBalanced())
        
        let input4 = "((*))"
        XCTAssertTrue(input4.isBalanced())
    }

}
