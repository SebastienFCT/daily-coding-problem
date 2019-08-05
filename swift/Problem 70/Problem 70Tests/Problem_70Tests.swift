//
//  Problem_70Tests.swift
//  Problem 70Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-03.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_70

class Problem_70Tests: XCTestCase {

    func test_example_with_naive_solution() {
        XCTAssert(Microsoft().naivePerfect(n: 1) == 19)
        XCTAssert(Microsoft().naivePerfect(n: 2) == 28)
    }
    
    func test_900_iteration() {
        print(Microsoft().naivePerfect(n: 899))
        print(Microsoft().naivePerfect(n: 900))
    }

}
