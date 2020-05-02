//
//  Problem_342Tests.swift
//  Problem 342Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-01.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_342

class Problem_342Tests: XCTestCase {

    func test_fold() {
        
        let input = [1, 2, 3, 4, 5]
        
        func add(left: Int, right: Int) -> Int {
            return left + right
        }
        
        let actual = fold(list: input, operation: add(left:right:), initial: 0)
        let expected = 15
        
        XCTAssert(actual == expected)
    }
}
