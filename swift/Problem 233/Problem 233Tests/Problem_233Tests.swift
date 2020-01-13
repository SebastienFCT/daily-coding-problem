//
//  Problem_233Tests.swift
//  Problem 233Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-13.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_233

class Problem_233Tests: XCTestCase {

    func test_fibonacci() {
        
        let expected = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765]
        
        var actual: [Int] = []
        for i in 0...20 {
            actual.append(fib(n: i))
        }
        
        XCTAssert(actual == expected)
    }

}
