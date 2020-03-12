//
//  Problem_292Tests.swift
//  Problem 292Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-12.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_292

class Problem_292Tests: XCTestCase {

    func test_example() {
        
        let input = Class(students: [
            (key: 0, value: [3]),
            (key: 1, value: [2]),
            (key: 2, value: [1, 4]),
            (key: 3, value: [0, 4, 5]),
            (key: 4, value: [2, 3]),
            (key: 5, value: [3])
        ])
        
        let actual = input.divide()
        print(actual)
    }

}
