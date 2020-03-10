//
//  Problem_290Tests.swift
//  Problem 290Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-10.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_290

class Problem_290Tests: XCTestCase {

    func test_example() {
        
        let input = MisteriousIsland(creatures: [.r, .g, .b, .g, .b])
        print(input.reduce())
        
    }

}
