//
//  Problem_1bTests.swift
//  Problem 1bTests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_1b

class Problem_1bTests: XCTestCase {

    func testGeneric() {
        let trunk = Branch(value: 17, maxLevel: 2, level: 0, rest: [10, 15, 3, 7])
        trunk.growBranches()
        
        XCTAssert(trunk.anyPathForValue())
    }
    
    func testGeneric2() {
        let trunk = Branch(value: 100, maxLevel: 5, level: 0, rest: [10, 6, 12, 890, 10, 10, 20, 5, 10, 90, 12, 22, 9, 10])
        trunk.growBranches()
        
        XCTAssert(trunk.anyPathForValue())
    }

}
